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
		aggiorna_gioco();
		LPC_TIM0->IR = 1; // Clear flag
	}
	return;
}

// TIMER 1: GESTIONE DURATA NOTA (Metronomo)
void TIMER1_IRQHandler (void)
{
	if(LPC_TIM1->IR & 1) 
	{ 
		current_note++;
		// Se trovi la pausa finale con durata 0, ricomincia da capo
		if(tetris_theme[current_note].freq == pause && tetris_theme[current_note].duration == 0) {
			current_note = 0; 
		}
		playNote(tetris_theme[current_note]);
		LPC_TIM1->IR = 1; // Clear flag
	}
	return;
}

// TIMER 2: GESTIONE AUDIO FREQUENZA (Speaker)
void TIMER2_IRQHandler (void)
{
	static int tick = 0;
	
	// --- VOLUME BASSO ---
	// Il massimo è 1023. Imposta 200 per un suono "dolce" e basso.
	int volume = 200; 

	if(LPC_TIM2->IR & 1) 
	{
		// Scrivi nel DAC: valore << 6
		if (tick == 0) {
			LPC_DAC->DACR = (volume << 6);
			tick = 1;
		}
		else {
			LPC_DAC->DACR = (0 << 6);
			tick = 0;
		}
		
		LPC_TIM2->IR = 1; // Clear flag
	}
	return;
}

void TIMER3_IRQHandler (void)
{
	if(LPC_TIM3->IR & 1) LPC_TIM3->IR = 1;
	return;
}