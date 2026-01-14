#include "music.h"
#include "LPC17xx.h"
#include "../timer/timer.h"

void playNote(NOTE note)
{
	if(note.freq != pause)
	{
		// --- FREQUENZA SU TIMER 2 (Non più Timer 0) ---
		reset_timer(2);
		
		// 1. Calcolo Tick: 25MHz / (Freq * 2)
		uint32_t ticks = 25000000 / (note.freq * 2);
		
		// 2. Inizializza Timer 2 con la frequenza della nota
		init_timer(2, 0, 0, 3, ticks);
		
		// 3. Configura DAC (P0.26) per l'uscita audio
		LPC_PINCON->PINSEL1 &= ~(3 << 20);
		LPC_PINCON->PINSEL1 |= (2 << 20);
		
		enable_timer(2);
	}
	
	// --- DURATA SU TIMER 1 (Rimane uguale) ---
	reset_timer(1);
	init_timer(1, 0, 0, 3, note.duration);
	enable_timer(1);
}

BOOL isNotePlaying(void)
{
	// Controlla Timer 2 e Timer 1
	return ((LPC_TIM2->TCR != 0) || (LPC_TIM1->TCR != 0));
}