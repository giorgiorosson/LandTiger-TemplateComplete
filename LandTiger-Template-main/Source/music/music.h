#ifndef MUSIC_H
#define MUSIC_H

#include <stdint.h> 

// Default: 1.65 - Modifica questo valore per cambiare la velocità del brano
#define SPEEDUP 1.6

#define TIMERSCALER 1
#define SECOND 0x17D7840 * TIMERSCALER

typedef char BOOL;
#define TRUE 1
#define FALSE 0

// Durate delle note (Calcolate in base al clock)
typedef enum note_durations
{
	time_semibiscroma = (unsigned int)(SECOND * SPEEDUP / 64.0f + 0.5), // 1/128
	time_biscroma = (unsigned int)(SECOND * SPEEDUP / 32.0f + 0.5),     // 1/64
	time_semicroma = (unsigned int)(SECOND * SPEEDUP / 16.0f + 0.5),    // 1/32
	time_croma = (unsigned int)(SECOND * SPEEDUP / 8.0f + 0.5),         // 1/16
	time_semiminima = (unsigned int)(SECOND * SPEEDUP / 4.0f + 0.5),    // 1/4
	time_minima = (unsigned int)(SECOND * SPEEDUP / 2.0f + 0.5),        // 1/2
	time_semibreve = (unsigned int)(SECOND * SPEEDUP + 0.5),            // 1
} NOTE_DURATION;

// Frequenze in HERTZ (Standard Pitch)
// Necessarie per la formula: ticks = 25MHz / (Freq * 2)
typedef enum frequencies
{
	pause = 0,
	
	// Ottava 2
	a2b = 104, // Ab2 / G#2
	a2  = 110,
	b2b = 117,
	b2  = 123,
	
	// Ottava 3
	c3  = 131,
	c3d = 139, // C#3 / Db3
	d3  = 147,
	d3d = 156, // D#3 / Eb3
	e3  = 165,
	f3  = 175,
	f3d = 185, // F#3 / Gb3
	g3  = 196,
	g3d = 208, // G#3 / Ab3 (a3b)
	a3  = 220,
	a3d = 233, // A#3 / Bb3
	b3  = 247,

	// Ottava 4 (Centrale)
	c4  = 262,
	c4d = 277,
	d4  = 294,
	d4d = 311,
	e4  = 330,
	f4  = 349,
	f4d = 370,
	g4  = 392,
	g4d = 415,
	a4  = 440, // Diapason
	a4d = 466,
	b4  = 494,

	// Ottava 5 (Necessaria per Tetris parte alta)
	c5  = 523,
	c5d = 554,
	d5  = 587,
	d5d = 622,
	e5  = 659,
	f5  = 698,
	f5d = 740,
	g5  = 784,
	g5d = 831,
	a5  = 880,
	a5d = 932,
	b5  = 988,
	
	// Ottava 6
	c6  = 1047
	
} FREQUENCY;

// Alias per compatibilità con vecchi codici se usavano nomi diversi
#define a3b g3d
#define c3b b2
#define a2b g2d // approssimazione

typedef struct 
{
	FREQUENCY freq;
	NOTE_DURATION duration;
} NOTE;

void playNote(NOTE note);
BOOL isNotePlaying(void);

#endif