#include "LPC17xx.h"
#include "timer.h"
#include "../game.h"
#include "../music/music.h"
static int tick = 0;
extern NOTE tetris_theme[]; 
static int current_note = 0;

/******************************************************************************
** Function name:		Timer0_IRQHandler
** Descriptions:		Gestisce lo SPEAKER (Software Toggle su P0.26)
******************************************************************************/
void TIMER0_IRQHandler (void)
{
	/* Variabile per abbassare il volume. 
	   Il massimo è 1023 (3.3V). 
	   Un valore intorno a 400-500 è un buon compromesso. */
	int volume = 400; 

	if(LPC_TIM0->IR & 1) 
	{
		// Alterna tra 0 e Volume
		if (tick == 0) {
			// Scrivi nel registro DAC: Valore << 6 (i bit 0-5 sono riservati)
			LPC_DAC->DACR = (volume << 6);
			tick = 1;
		}
		else {
			LPC_DAC->DACR = (0 << 6);
			tick = 0;
		}
		
		LPC_TIM0->IR = 1; // Clear flag
	}
	return;
}

/******************************************************************************
** Function name:		Timer1_IRQHandler
** Descriptions:		Gestisce la DURATA delle note
******************************************************************************/
void TIMER1_IRQHandler (void)
{
	if(LPC_TIM1->IR & 1) 
	{ 
		// Passa alla nota successiva
		current_note++;
		
		// Controllo fine canzone
		if(tetris_theme[current_note].freq == pause && tetris_theme[current_note].duration == 0) {
			current_note = 0; // Loop
		}

		playNote(tetris_theme[current_note]);
		
		LPC_TIM1->IR = 1; 
	}
	return;
}

/******************************************************************************
** Function name:		Timer2_IRQHandler
** Descriptions:		Gestisce il GIOCO (Tetris)
******************************************************************************/
void TIMER2_IRQHandler (void)
{
	if(LPC_TIM2->IR & 1) 
	{ 
		aggiorna_gioco();
		LPC_TIM2->IR = 1;				 
	}
	return;
}

void TIMER3_IRQHandler (void)
{
	if(LPC_TIM3->IR & 1) LPC_TIM3->IR = 1;
	return;
}