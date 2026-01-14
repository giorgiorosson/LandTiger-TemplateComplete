#include "music.h"
#include "LPC17xx.h"
#include "../timer/timer.h"

void playNote(NOTE note)
{
	if(note.freq != pause)
	{
		reset_timer(0);
		
		// --- 1. CALCOLO FREQUENZA ---
		// Convertiamo Hz in Tick del processore (25MHz)
		// Formula: 25.000.000 / (Freq * 2)
		uint32_t ticks = 25000000 / (note.freq * 2);
		
		// --- 2. INIT TIMER 0 (Speaker) ---
		// Parametri: TimerNum=0, Prescaler=0, MatchReg=0, Config=3(Int+Reset), Value=ticks
		init_timer(0, 0, 0, 3, ticks);
		
		// --- 3. CONFIGURAZIONE PIN DAC (P0.26) ---
		// Impostiamo P0.26 come uscita analogica per suono pulito
		LPC_PINCON->PINSEL1 &= ~(3 << 20); // Pulisce
		LPC_PINCON->PINSEL1 |= (2 << 20);  // Imposta AOUT
		
		enable_timer(0);
	}
	reset_timer(1);
	
	// --- 4. INIT TIMER 1 (Durata) ---
	// Parametri: TimerNum=1, Prescaler=0, MatchReg=0, Config=3, Value=duration
	init_timer(1, 0, 0, 3, note.duration);
	
	enable_timer(1);
}

BOOL isNotePlaying(void)
{
	return ((LPC_TIM0->TCR != 0) || (LPC_TIM1->TCR != 0));
}