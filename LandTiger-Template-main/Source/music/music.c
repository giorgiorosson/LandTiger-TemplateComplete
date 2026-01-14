#include "music.h"
#include "LPC17xx.h"
#include "../timer/timer.h"

void playNote(NOTE note)
{
    if(note.freq != pause)
    {
        reset_timer(0);
        
        // --- CORREZIONE MATEMATICA FONDAMENTALE ---
        // Il clock è 25MHz. Dobbiamo calcolare i tick per semi-periodo.
        // Esempio: 440Hz -> vogliamo un cambio stato ogni 1/880 di secondo.
        // 25.000.000 / (440 * 2) = 28.409 tick.
        uint32_t ticks = 25000000 / (note.freq * 2);
        
        init_timer(0, 0, 0, 3, ticks);
        
        // Configurazione DAC (P0.26 come AOUT)
        LPC_PINCON->PINSEL1 &= ~(3 << 20);
        LPC_PINCON->PINSEL1 |= (2 << 20);
        
        enable_timer(0);
    }
    reset_timer(1);
    init_timer(1, 0, 0, 3, note.duration);
    enable_timer(1);
}

BOOL isNotePlaying(void)
{
    return ((LPC_TIM0->TCR != 0) || (LPC_TIM1->TCR != 0));
}