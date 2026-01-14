#include "LPC17xx.h"
#include "timer.h"
#include "../game.h"
#include "../music/music.h"

extern NOTE tetris_theme[];
static int current_note = 0;

// TIMER 0: GESTIONE GIOCO (Tetris)
void TIMER0_IRQHandler (void)
{
	if(LPC_TIM0->IR & 1) 
	{ 
		// Qui c'è la logica del gioco (come volevi tu)
		aggiorna_gioco();
		LPC_TIM0->IR = 1; // Reset flag
	}
	return;
}

// TIMER 1: GESTIONE CAMBIO NOTA
void TIMER1_IRQHandler (void)
{
	if(LPC_TIM1->IR & 1) 
	{ 
		current_note++;
		if(tetris_theme[current_note].freq == pause && tetris_theme[current_note].duration == 0) {
			current_note = 0; // Ricomincia canzone
		}
		playNote(tetris_theme[current_note]);
		LPC_TIM1->IR = 1; 
	}
	return;
}

// TIMER 2: GESTIONE AUDIO (Speaker)
void TIMER2_IRQHandler (void)
{
	static int tick = 0;
	int volume = 800; // Regola volume (0-1023)

	if(LPC_TIM2->IR & 1) 
	{
		// Gestione DAC (Suono)
		if (tick == 0) {
			LPC_DAC->DACR = (volume << 6);
			tick = 1;
		}
		else {
			LPC_DAC->DACR = (0 << 6);
			tick = 0;
		}
		
		LPC_TIM2->IR = 1; // Reset flag
	}
	return;
}

void TIMER3_IRQHandler (void)
{
	if(LPC_TIM3->IR & 1) LPC_TIM3->IR = 1;
	return;
}