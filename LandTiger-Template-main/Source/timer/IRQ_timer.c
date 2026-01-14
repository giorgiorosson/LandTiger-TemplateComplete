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
	static int tick = 0;
	// Abbassa questo valore se il volume è troppo alto (max 1023)
	int volume = 400; 

	if(LPC_TIM0->IR & 1) 
	{
		// Scrittura sul DAC
		if (tick == 0) {
			LPC_DAC->DACR = (volume << 6); // Onda ALTA
			tick = 1;
		}
		else {
			LPC_DAC->DACR = (0 << 6);      // Onda BASSA
			tick = 0;
		}
		
		LPC_TIM0->IR = 1; // IMPORTANTE: Resetta il flag o si blocca tutto!
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