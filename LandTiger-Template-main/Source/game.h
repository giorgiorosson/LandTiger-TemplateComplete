#ifndef GIOCO_H
#define GIOCO_H

#include <stdint.h>
#include "GLCD/GLCD.h" 

//Dimensioni e Costanti di Gioco 
#define MAX_X           240     // Larghezza schermo scheda
#define MAX_Y           320     // Altezza 

#define RIGHE_CAMPO     20      // Righe della griglia di gioco
#define COLONNE_CAMPO   10      // Colonne 
#define DIM_BLOCCO      15      // Dimensione in pixel di ogni blocco

//  offset per  la griglia 
//  Margine sinistro di 5 pixel, Margine alto di 10 pixel
#define OFFSET_X_GRIGLIA  5
#define OFFSET_Y_GRIGLIA  10

// Stati del Gioco
typedef enum {
    GIOCO_FINITO,
    GIOCO_IN_CORSO,
    GIOCO_IN_PAUSA
} StatoGioco;

// Tipi di Tetramini 
typedef enum {
    BLOCCO_I, BLOCCO_J, BLOCCO_L, BLOCCO_O, BLOCCO_S, BLOCCO_T, BLOCCO_Z
} TipoBlocco;

//  Colori Tetris  RGB565 
// Formato: 5 bit Rosso, 6 bit Verde, 5 bit Blu
// I nomi iniziano con T_ per distinguerli da quelli di sistema

#define C_Ciano     0x07FF  // Ciano (I piece) - R=0, G=63, B=31 (Nota: 0x7FFF è ciano chiaro, 0x07FF è puro ciano standard)
#define C_Blu       0x001F  // Blu (J piece) - R=0, G=0, B=31
#define C_Arancio   0xFD20  // Arancione (L piece) - R=31, G=40, B=0
#define C_Giallo    0xFFE0  // Giallo (O piece) - R=31, G=63, B=0
#define C_Verde     0x07E0  // Verde (S piece) - R=0, G=63, B=0
#define C_Magenta   0xF81F  // Magenta (T piece) - R=31, G=0, B=31
#define C_Rosso     0xF800  // Rosso (Z piece) - R=31, G=0, B=0

// Colori di utilità
#define C_Nero      0x0000  // Sfondo
#define C_Bianco    0xFFFF  // Testo/Bordi
#define C_Grigio    0x8410  // Grigio per griglia/ombra (opzionale)


// --- Strutture Dati ---

// Un punto nella griglia 
typedef struct {
    int riga;
    int colonna;
} Punto;

// Definizione di un Tetramino
typedef struct {
    Punto celle[4];     // Ogni blocco è formato da 4 celle
    Punto posizione;    // Posizione (riga, colonna) del pivot del blocco nella griglia
    uint16_t colore;    // Colore del blocco (usiamo i colori definiti in GLCD.h)
    TipoBlocco tipo;    // Tipo di blocco
    int rotazione;      // Stato di rotazione (0, 1, 2, 3)
} Tetramino;

// Variabili Globali Esterne (accessibili da main e interrupt)
extern uint16_t griglia[RIGHE_CAMPO][COLONNE_CAMPO]; // Matrice che rappresenta la griglia (contiene i colori)
extern Tetramino tetraminoCorrente;                  // Il blocco che sta cadendo
extern Tetramino tetraminoSuccessivo;                // Il prossimo blocco (per la preview)
extern volatile StatoGioco stato_gioco;              // Stato corrente del gioco
extern int punteggio;                                // Punteggio corrente

// Prototipi di Funzione 
void inizializza_gioco(void);      // Inizializza variabili e schermo
void aggiorna_gioco(void);         // Logica principale (chiamata dal timer)
void genera_blocco(void);          // Genera un nuovo blocco
void disegna_griglia_statica(void); // Disegna i contorni statici
extern volatile int mod_caduta_rapida;
extern void alla_pressione_tasto1(void);

#endif