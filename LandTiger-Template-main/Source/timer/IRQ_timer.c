#include "LPC17xx.h"
#include "timer.h"
#include "../game.h"
#include "../music/music.h" // Assicurati di includere music.h

extern NOTE tetris_theme[];
static int current_note = 0;

// TIMER 0: GESTIONE AUDIO (DAC)
void TIMER0_IRQHandler (void)
{
    static int tick = 0;
    int volume = 400; // Regola il volume (0-1023)

    if(LPC_TIM0->IR & 1) // MR0
    {
        // Gestione DAC per suono pulito
        if (tick == 0) {
            LPC_DAC->DACR = (volume << 6);
            tick = 1;
        } else {
            LPC_DAC->DACR = (0 << 6);
            tick = 0;
        }
        LPC_TIM0->IR = 1; // Clear flag
    }
    return;
}

// TIMER 1: GESTIONE DURATA NOTE
void TIMER1_IRQHandler (void)
{
    if(LPC_TIM1->IR & 1) // MR0
    {
        current_note++;
        // Controllo fine array/loop
        if(tetris_theme[current_note].freq == pause && tetris_theme[current_note].duration == 0) {
            current_note = 0; 
        }
        playNote(tetris_theme[current_note]);
        LPC_TIM1->IR = 1; // Clear flag
    }
    return;
}

// TIMER 2: GESTIONE GIOCO (TETRIS)
void TIMER2_IRQHandler (void)
{
    if(LPC_TIM2->IR & 1) // MR0
    {
        // La logica del gioco ora è QUI
        aggiorna_gioco();
        LPC_TIM2->IR = 1; // Clear flag
    }
    return;
}

void TIMER3_IRQHandler (void)
{
    if(LPC_TIM3->IR & 1) LPC_TIM3->IR = 1;
    return;
}