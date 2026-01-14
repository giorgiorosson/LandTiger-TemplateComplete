# 1 "Source/game.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 404 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "Source/game.c" 2
# 1 "Source\\game.h" 1




# 1 "Source\\GLCD/GLCD.h" 1
# 26 "Source\\GLCD/GLCD.h"
# 1 "C:/Users/giorg/AppData/Local/Arm/Packs/Keil/LPC1700_DFP/2.7.2/Device/Include\\LPC17xx.h" 1
# 41 "C:/Users/giorg/AppData/Local/Arm/Packs/Keil/LPC1700_DFP/2.7.2/Device/Include\\LPC17xx.h"
typedef enum IRQn
{

  Reset_IRQn = -15,
  NonMaskableInt_IRQn = -14,
  HardFault_IRQn = -13,
  MemoryManagement_IRQn = -12,
  BusFault_IRQn = -11,
  UsageFault_IRQn = -10,
  SVCall_IRQn = -5,
  DebugMonitor_IRQn = -4,
  PendSV_IRQn = -2,
  SysTick_IRQn = -1,


  WDT_IRQn = 0,
  TIMER0_IRQn = 1,
  TIMER1_IRQn = 2,
  TIMER2_IRQn = 3,
  TIMER3_IRQn = 4,
  UART0_IRQn = 5,
  UART1_IRQn = 6,
  UART2_IRQn = 7,
  UART3_IRQn = 8,
  PWM1_IRQn = 9,
  I2C0_IRQn = 10,
  I2C1_IRQn = 11,
  I2C2_IRQn = 12,
  SPI_IRQn = 13,
  SSP0_IRQn = 14,
  SSP1_IRQn = 15,
  PLL0_IRQn = 16,
  RTC_IRQn = 17,
  EINT0_IRQn = 18,
  EINT1_IRQn = 19,
  EINT2_IRQn = 20,
  EINT3_IRQn = 21,
  ADC_IRQn = 22,
  BOD_IRQn = 23,
  USB_IRQn = 24,
  CAN_IRQn = 25,
  DMA_IRQn = 26,
  I2S_IRQn = 27,
  ENET_IRQn = 28,
  RIT_IRQn = 29,
  MCPWM_IRQn = 30,
  QEI_IRQn = 31,
  PLL1_IRQn = 32,
  USBActivity_IRQn = 33,
  CANActivity_IRQn = 34,
} IRQn_Type;
# 106 "C:/Users/giorg/AppData/Local/Arm/Packs/Keil/LPC1700_DFP/2.7.2/Device/Include\\LPC17xx.h"
# 1 "./Source/CMSIS_core\\core_cm3.h" 1
# 29 "./Source/CMSIS_core\\core_cm3.h" 3





# 1 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdint.h" 1 3
# 56 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdint.h" 3
typedef signed char int8_t;
typedef signed short int int16_t;
typedef signed int int32_t;
typedef signed long long int int64_t;


typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long long int uint64_t;





typedef signed char int_least8_t;
typedef signed short int int_least16_t;
typedef signed int int_least32_t;
typedef signed long long int int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;
typedef unsigned long long int uint_least64_t;




typedef signed int int_fast8_t;
typedef signed int int_fast16_t;
typedef signed int int_fast32_t;
typedef signed long long int int_fast64_t;


typedef unsigned int uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
typedef unsigned long long int uint_fast64_t;






typedef signed int intptr_t;
typedef unsigned int uintptr_t;



typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
# 35 "./Source/CMSIS_core\\core_cm3.h" 2 3
# 63 "./Source/CMSIS_core\\core_cm3.h" 3
# 1 "./Source/CMSIS_core\\cmsis_version.h" 1 3
# 29 "./Source/CMSIS_core\\cmsis_version.h" 3
# 64 "./Source/CMSIS_core\\core_cm3.h" 2 3
# 115 "./Source/CMSIS_core\\core_cm3.h" 3
# 1 "./Source/CMSIS_core\\cmsis_compiler.h" 1 3
# 47 "./Source/CMSIS_core\\cmsis_compiler.h" 3
# 1 "./Source/CMSIS_core\\cmsis_armclang.h" 1 3
# 31 "./Source/CMSIS_core\\cmsis_armclang.h" 3
# 64 "./Source/CMSIS_core\\cmsis_armclang.h" 3
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

  struct __attribute__((packed)) T_UINT32 { uint32_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

  struct __attribute__((packed, aligned(1))) T_UINT16_WRITE { uint16_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

  struct __attribute__((packed, aligned(1))) T_UINT16_READ { uint16_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

  struct __attribute__((packed, aligned(1))) T_UINT32_WRITE { uint32_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

  struct __attribute__((packed, aligned(1))) T_UINT32_READ { uint32_t v; };
#pragma clang diagnostic pop
# 260 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __ROR(uint32_t op1, uint32_t op2)
{
  op2 %= 32U;
  if (op2 == 0U)
  {
    return op1;
  }
  return (op1 >> op2) | (op1 << (32U - op2));
}
# 295 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint8_t __CLZ(uint32_t value)
{
# 306 "./Source/CMSIS_core\\cmsis_armclang.h" 3
  if (value == 0U)
  {
    return 32U;
  }
  return __builtin_clz(value);
}
# 425 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __RRX(uint32_t value)
{
  uint32_t result;

  __asm volatile ("rrx %0, %1" : "=r" (result) : "r" (value) );
  return(result);
}
# 440 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint8_t __LDRBT(volatile uint8_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldrbt %0, %1" : "=r" (result) : "Q" (*ptr) );
  return ((uint8_t) result);
}
# 455 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint16_t __LDRHT(volatile uint16_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldrht %0, %1" : "=r" (result) : "Q" (*ptr) );
  return ((uint16_t) result);
}
# 470 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __LDRT(volatile uint32_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldrt %0, %1" : "=r" (result) : "Q" (*ptr) );
  return(result);
}
# 485 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STRBT(uint8_t value, volatile uint8_t *ptr)
{
  __asm volatile ("strbt %1, %0" : "=Q" (*ptr) : "r" ((uint32_t)value) );
}
# 497 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STRHT(uint16_t value, volatile uint16_t *ptr)
{
  __asm volatile ("strht %1, %0" : "=Q" (*ptr) : "r" ((uint32_t)value) );
}
# 509 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STRT(uint32_t value, volatile uint32_t *ptr)
{
  __asm volatile ("strt %1, %0" : "=Q" (*ptr) : "r" (value) );
}
# 737 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __enable_irq(void)
{
  __asm volatile ("cpsie i" : : : "memory");
}
# 750 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __disable_irq(void)
{
  __asm volatile ("cpsid i" : : : "memory");
}
# 762 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_CONTROL(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, control" : "=r" (result) );
  return(result);
}
# 792 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_CONTROL(uint32_t control)
{
  __asm volatile ("MSR control, %0" : : "r" (control) : "memory");
  __builtin_arm_isb(0xF);
}
# 818 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_IPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, ipsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_APSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, apsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_xPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, xpsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_PSP(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, psp" : "=r" (result) );
  return(result);
}
# 890 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_PSP(uint32_t topOfProcStack)
{
  __asm volatile ("MSR psp, %0" : : "r" (topOfProcStack) : );
}
# 914 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_MSP(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, msp" : "=r" (result) );
  return(result);
}
# 944 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_MSP(uint32_t topOfMainStack)
{
  __asm volatile ("MSR msp, %0" : : "r" (topOfMainStack) : );
}
# 995 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_PRIMASK(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, primask" : "=r" (result) );
  return(result);
}
# 1025 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_PRIMASK(uint32_t priMask)
{
  __asm volatile ("MSR primask, %0" : : "r" (priMask) : "memory");
}
# 1053 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __enable_fault_irq(void)
{
  __asm volatile ("cpsie f" : : : "memory");
}







__attribute__((always_inline)) static __inline void __disable_fault_irq(void)
{
  __asm volatile ("cpsid f" : : : "memory");
}







__attribute__((always_inline)) static __inline uint32_t __get_BASEPRI(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, basepri" : "=r" (result) );
  return(result);
}
# 1105 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_BASEPRI(uint32_t basePri)
{
  __asm volatile ("MSR basepri, %0" : : "r" (basePri) : "memory");
}
# 1130 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_BASEPRI_MAX(uint32_t basePri)
{
  __asm volatile ("MSR basepri_max, %0" : : "r" (basePri) : "memory");
}







__attribute__((always_inline)) static __inline uint32_t __get_FAULTMASK(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, faultmask" : "=r" (result) );
  return(result);
}
# 1171 "./Source/CMSIS_core\\cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_FAULTMASK(uint32_t faultMask)
{
  __asm volatile ("MSR faultmask, %0" : : "r" (faultMask) : "memory");
}
# 48 "./Source/CMSIS_core\\cmsis_compiler.h" 2 3
# 116 "./Source/CMSIS_core\\core_cm3.h" 2 3
# 211 "./Source/CMSIS_core\\core_cm3.h" 3
typedef union
{
  struct
  {
    uint32_t _reserved0:27;
    uint32_t Q:1;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} APSR_Type;
# 245 "./Source/CMSIS_core\\core_cm3.h" 3
typedef union
{
  struct
  {
    uint32_t ISR:9;
    uint32_t _reserved0:23;
  } b;
  uint32_t w;
} IPSR_Type;
# 263 "./Source/CMSIS_core\\core_cm3.h" 3
typedef union
{
  struct
  {
    uint32_t ISR:9;
    uint32_t _reserved0:1;
    uint32_t ICI_IT_1:6;
    uint32_t _reserved1:8;
    uint32_t T:1;
    uint32_t ICI_IT_2:2;
    uint32_t Q:1;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} xPSR_Type;
# 314 "./Source/CMSIS_core\\core_cm3.h" 3
typedef union
{
  struct
  {
    uint32_t nPRIV:1;
    uint32_t SPSEL:1;
    uint32_t _reserved1:30;
  } b;
  uint32_t w;
} CONTROL_Type;
# 345 "./Source/CMSIS_core\\core_cm3.h" 3
typedef struct
{
  volatile uint32_t ISER[8U];
        uint32_t RESERVED0[24U];
  volatile uint32_t ICER[8U];
        uint32_t RESERVED1[24U];
  volatile uint32_t ISPR[8U];
        uint32_t RESERVED2[24U];
  volatile uint32_t ICPR[8U];
        uint32_t RESERVED3[24U];
  volatile uint32_t IABR[8U];
        uint32_t RESERVED4[56U];
  volatile uint8_t IP[240U];
        uint32_t RESERVED5[644U];
  volatile uint32_t STIR;
} NVIC_Type;
# 379 "./Source/CMSIS_core\\core_cm3.h" 3
typedef struct
{
  volatile const uint32_t CPUID;
  volatile uint32_t ICSR;
  volatile uint32_t VTOR;
  volatile uint32_t AIRCR;
  volatile uint32_t SCR;
  volatile uint32_t CCR;
  volatile uint8_t SHP[12U];
  volatile uint32_t SHCSR;
  volatile uint32_t CFSR;
  volatile uint32_t HFSR;
  volatile uint32_t DFSR;
  volatile uint32_t MMFAR;
  volatile uint32_t BFAR;
  volatile uint32_t AFSR;
  volatile const uint32_t PFR[2U];
  volatile const uint32_t DFR;
  volatile const uint32_t ADR;
  volatile const uint32_t MMFR[4U];
  volatile const uint32_t ISAR[5U];
        uint32_t RESERVED0[5U];
  volatile uint32_t CPACR;
} SCB_Type;
# 660 "./Source/CMSIS_core\\core_cm3.h" 3
typedef struct
{
        uint32_t RESERVED0[1U];
  volatile const uint32_t ICTR;



        uint32_t RESERVED1[1U];

} SCnSCB_Type;
# 706 "./Source/CMSIS_core\\core_cm3.h" 3
typedef struct
{
  volatile uint32_t CTRL;
  volatile uint32_t LOAD;
  volatile uint32_t VAL;
  volatile const uint32_t CALIB;
} SysTick_Type;
# 758 "./Source/CMSIS_core\\core_cm3.h" 3
typedef struct
{
  volatile union
  {
    volatile uint8_t u8;
    volatile uint16_t u16;
    volatile uint32_t u32;
  } PORT [32U];
        uint32_t RESERVED0[864U];
  volatile uint32_t TER;
        uint32_t RESERVED1[15U];
  volatile uint32_t TPR;
        uint32_t RESERVED2[15U];
  volatile uint32_t TCR;
        uint32_t RESERVED3[32U];
        uint32_t RESERVED4[43U];
  volatile uint32_t LAR;
  volatile const uint32_t LSR;
        uint32_t RESERVED5[6U];
  volatile const uint32_t PID4;
  volatile const uint32_t PID5;
  volatile const uint32_t PID6;
  volatile const uint32_t PID7;
  volatile const uint32_t PID0;
  volatile const uint32_t PID1;
  volatile const uint32_t PID2;
  volatile const uint32_t PID3;
  volatile const uint32_t CID0;
  volatile const uint32_t CID1;
  volatile const uint32_t CID2;
  volatile const uint32_t CID3;
} ITM_Type;
# 846 "./Source/CMSIS_core\\core_cm3.h" 3
typedef struct
{
  volatile uint32_t CTRL;
  volatile uint32_t CYCCNT;
  volatile uint32_t CPICNT;
  volatile uint32_t EXCCNT;
  volatile uint32_t SLEEPCNT;
  volatile uint32_t LSUCNT;
  volatile uint32_t FOLDCNT;
  volatile const uint32_t PCSR;
  volatile uint32_t COMP0;
  volatile uint32_t MASK0;
  volatile uint32_t FUNCTION0;
        uint32_t RESERVED0[1U];
  volatile uint32_t COMP1;
  volatile uint32_t MASK1;
  volatile uint32_t FUNCTION1;
        uint32_t RESERVED1[1U];
  volatile uint32_t COMP2;
  volatile uint32_t MASK2;
  volatile uint32_t FUNCTION2;
        uint32_t RESERVED2[1U];
  volatile uint32_t COMP3;
  volatile uint32_t MASK3;
  volatile uint32_t FUNCTION3;
} DWT_Type;
# 993 "./Source/CMSIS_core\\core_cm3.h" 3
typedef struct
{
  volatile const uint32_t SSPSR;
  volatile uint32_t CSPSR;
        uint32_t RESERVED0[2U];
  volatile uint32_t ACPR;
        uint32_t RESERVED1[55U];
  volatile uint32_t SPPR;
        uint32_t RESERVED2[131U];
  volatile const uint32_t FFSR;
  volatile uint32_t FFCR;
  volatile const uint32_t FSCR;
        uint32_t RESERVED3[759U];
  volatile const uint32_t TRIGGER;
  volatile const uint32_t FIFO0;
  volatile const uint32_t ITATBCTR2;
        uint32_t RESERVED4[1U];
  volatile const uint32_t ITATBCTR0;
  volatile const uint32_t FIFO1;
  volatile uint32_t ITCTRL;
        uint32_t RESERVED5[39U];
  volatile uint32_t CLAIMSET;
  volatile uint32_t CLAIMCLR;
        uint32_t RESERVED7[8U];
  volatile const uint32_t DEVID;
  volatile const uint32_t DEVTYPE;
} TPI_Type;
# 1155 "./Source/CMSIS_core\\core_cm3.h" 3
typedef struct
{
  volatile const uint32_t TYPE;
  volatile uint32_t CTRL;
  volatile uint32_t RNR;
  volatile uint32_t RBAR;
  volatile uint32_t RASR;
  volatile uint32_t RBAR_A1;
  volatile uint32_t RASR_A1;
  volatile uint32_t RBAR_A2;
  volatile uint32_t RASR_A2;
  volatile uint32_t RBAR_A3;
  volatile uint32_t RASR_A3;
} MPU_Type;
# 1251 "./Source/CMSIS_core\\core_cm3.h" 3
typedef struct
{
  volatile uint32_t DHCSR;
  volatile uint32_t DCRSR;
  volatile uint32_t DCRDR;
  volatile uint32_t DEMCR;
} CoreDebug_Type;
# 1477 "./Source/CMSIS_core\\core_cm3.h" 3
static __inline void __NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
{
  uint32_t reg_value;
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);

  reg_value = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR;
  reg_value &= ~((uint32_t)((0xFFFFUL << 16U) | (7UL << 8U)));
  reg_value = (reg_value |
                ((uint32_t)0x5FAUL << 16U) |
                (PriorityGroupTmp << 8U) );
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR = reg_value;
}







static __inline uint32_t __NVIC_GetPriorityGrouping(void)
{
  return ((uint32_t)((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) >> 8U));
}
# 1508 "./Source/CMSIS_core\\core_cm3.h" 3
static __inline void __NVIC_EnableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    __asm volatile("":::"memory");
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
    __asm volatile("":::"memory");
  }
}
# 1527 "./Source/CMSIS_core\\core_cm3.h" 3
static __inline uint32_t __NVIC_GetEnableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1546 "./Source/CMSIS_core\\core_cm3.h" 3
static __inline void __NVIC_DisableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
    __builtin_arm_dsb(0xF);
    __builtin_arm_isb(0xF);
  }
}
# 1565 "./Source/CMSIS_core\\core_cm3.h" 3
static __inline uint32_t __NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1584 "./Source/CMSIS_core\\core_cm3.h" 3
static __inline void __NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1599 "./Source/CMSIS_core\\core_cm3.h" 3
static __inline void __NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1616 "./Source/CMSIS_core\\core_cm3.h" 3
static __inline uint32_t __NVIC_GetActive(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IABR[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1638 "./Source/CMSIS_core\\core_cm3.h" 3
static __inline void __NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)IRQn)] = (uint8_t)((priority << (8U - 5)) & (uint32_t)0xFFUL);
  }
  else
  {
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[(((uint32_t)IRQn) & 0xFUL)-4UL] = (uint8_t)((priority << (8U - 5)) & (uint32_t)0xFFUL);
  }
}
# 1660 "./Source/CMSIS_core\\core_cm3.h" 3
static __inline uint32_t __NVIC_GetPriority(IRQn_Type IRQn)
{

  if ((int32_t)(IRQn) >= 0)
  {
    return(((uint32_t)((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)IRQn)] >> (8U - 5)));
  }
  else
  {
    return(((uint32_t)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[(((uint32_t)IRQn) & 0xFUL)-4UL] >> (8U - 5)));
  }
}
# 1685 "./Source/CMSIS_core\\core_cm3.h" 3
static __inline uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(5)) ? (uint32_t)(5) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits = ((PriorityGroupTmp + (uint32_t)(5)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(5));

  return (
           ((PreemptPriority & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL)) << SubPriorityBits) |
           ((SubPriority & (uint32_t)((1UL << (SubPriorityBits )) - 1UL)))
         );
}
# 1712 "./Source/CMSIS_core\\core_cm3.h" 3
static __inline void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* const pPreemptPriority, uint32_t* const pSubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(5)) ? (uint32_t)(5) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits = ((PriorityGroupTmp + (uint32_t)(5)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(5));

  *pPreemptPriority = (Priority >> SubPriorityBits) & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL);
  *pSubPriority = (Priority ) & (uint32_t)((1UL << (SubPriorityBits )) - 1UL);
}
# 1735 "./Source/CMSIS_core\\core_cm3.h" 3
static __inline void __NVIC_SetVector(IRQn_Type IRQn, uint32_t vector)
{
  uint32_t *vectors = (uint32_t *)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->VTOR;
  vectors[(int32_t)IRQn + 16] = vector;

}
# 1751 "./Source/CMSIS_core\\core_cm3.h" 3
static __inline uint32_t __NVIC_GetVector(IRQn_Type IRQn)
{
  uint32_t *vectors = (uint32_t *)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->VTOR;
  return vectors[(int32_t)IRQn + 16];
}






__attribute__((__noreturn__)) static __inline void __NVIC_SystemReset(void)
{
  __builtin_arm_dsb(0xF);

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR = (uint32_t)((0x5FAUL << 16U) |
                           (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) |
                            (1UL << 2U) );
  __builtin_arm_dsb(0xF);

  for(;;)
  {
    __builtin_arm_nop();
  }
}
# 1784 "./Source/CMSIS_core\\core_cm3.h" 3
# 1 "./Source/CMSIS_core\\mpu_armv7.h" 1 3
# 29 "./Source/CMSIS_core\\mpu_armv7.h" 3
# 183 "./Source/CMSIS_core\\mpu_armv7.h" 3
typedef struct {
  uint32_t RBAR; //!< The region base address register value (RBAR)
  uint32_t RASR; //!< The region attribute and size register value (RASR) \ref MPU_RASR
} ARM_MPU_Region_t;




static __inline void ARM_MPU_Enable(uint32_t MPU_Control)
{
  __builtin_arm_dmb(0xF);
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->CTRL = MPU_Control | (1UL );

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHCSR |= (1UL << 16U);

  __builtin_arm_dsb(0xF);
  __builtin_arm_isb(0xF);
}



static __inline void ARM_MPU_Disable(void)
{
  __builtin_arm_dmb(0xF);

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHCSR &= ~(1UL << 16U);

  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->CTRL &= ~(1UL );
  __builtin_arm_dsb(0xF);
  __builtin_arm_isb(0xF);
}




static __inline void ARM_MPU_ClrRegion(uint32_t rnr)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RNR = rnr;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR = 0U;
}





static __inline void ARM_MPU_SetRegion(uint32_t rbar, uint32_t rasr)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR = rbar;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR = rasr;
}






static __inline void ARM_MPU_SetRegionEx(uint32_t rnr, uint32_t rbar, uint32_t rasr)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RNR = rnr;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR = rbar;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR = rasr;
}






static __inline void ARM_MPU_OrderedMemcpy(volatile uint32_t* dst, const uint32_t* __restrict src, uint32_t len)
{
  uint32_t i;
  for (i = 0U; i < len; ++i)
  {
    dst[i] = src[i];
  }
}





static __inline void ARM_MPU_Load(ARM_MPU_Region_t const* table, uint32_t cnt)
{
  const uint32_t rowWordSize = sizeof(ARM_MPU_Region_t)/4U;
  while (cnt > 4U) {
    ARM_MPU_OrderedMemcpy(&(((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR), &(table->RBAR), 4U*rowWordSize);
    table += 4U;
    cnt -= 4U;
  }
  ARM_MPU_OrderedMemcpy(&(((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR), &(table->RBAR), cnt*rowWordSize);
}
# 1785 "./Source/CMSIS_core\\core_cm3.h" 2 3
# 1805 "./Source/CMSIS_core\\core_cm3.h" 3
static __inline uint32_t SCB_GetFPUType(void)
{
    return 0U;
}
# 1836 "./Source/CMSIS_core\\core_cm3.h" 3
static __inline uint32_t SysTick_Config(uint32_t ticks)
{
  if ((ticks - 1UL) > (0xFFFFFFUL ))
  {
    return (1UL);
  }

  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD = (uint32_t)(ticks - 1UL);
  __NVIC_SetPriority (SysTick_IRQn, (1UL << 5) - 1UL);
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL = 0UL;
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL = (1UL << 2U) |
                   (1UL << 1U) |
                   (1UL );
  return (0UL);
}
# 1866 "./Source/CMSIS_core\\core_cm3.h" 3
extern volatile int32_t ITM_RxBuffer;
# 1878 "./Source/CMSIS_core\\core_cm3.h" 3
static __inline uint32_t ITM_SendChar (uint32_t ch)
{
  if (((((ITM_Type *) (0xE0000000UL) )->TCR & (1UL )) != 0UL) &&
      ((((ITM_Type *) (0xE0000000UL) )->TER & 1UL ) != 0UL) )
  {
    while (((ITM_Type *) (0xE0000000UL) )->PORT[0U].u32 == 0UL)
    {
      __builtin_arm_nop();
    }
    ((ITM_Type *) (0xE0000000UL) )->PORT[0U].u8 = (uint8_t)ch;
  }
  return (ch);
}
# 1899 "./Source/CMSIS_core\\core_cm3.h" 3
static __inline int32_t ITM_ReceiveChar (void)
{
  int32_t ch = -1;

  if (ITM_RxBuffer != ((int32_t)0x5AA55AA5U))
  {
    ch = ITM_RxBuffer;
    ITM_RxBuffer = ((int32_t)0x5AA55AA5U);
  }

  return (ch);
}
# 1919 "./Source/CMSIS_core\\core_cm3.h" 3
static __inline int32_t ITM_CheckChar (void)
{

  if (ITM_RxBuffer == ((int32_t)0x5AA55AA5U))
  {
    return (0);
  }
  else
  {
    return (1);
  }
}
# 107 "C:/Users/giorg/AppData/Local/Arm/Packs/Keil/LPC1700_DFP/2.7.2/Device/Include\\LPC17xx.h" 2
# 1 "C:/Users/giorg/AppData/Local/Arm/Packs/Keil/LPC1700_DFP/2.7.2/Device/Include\\system_LPC17xx.h" 1
# 49 "C:/Users/giorg/AppData/Local/Arm/Packs/Keil/LPC1700_DFP/2.7.2/Device/Include\\system_LPC17xx.h"
extern uint32_t SystemCoreClock;






extern void SystemInit (void);







extern void SystemCoreClockUpdate (void);
# 108 "C:/Users/giorg/AppData/Local/Arm/Packs/Keil/LPC1700_DFP/2.7.2/Device/Include\\LPC17xx.h" 2
# 120 "C:/Users/giorg/AppData/Local/Arm/Packs/Keil/LPC1700_DFP/2.7.2/Device/Include\\LPC17xx.h"
typedef struct
{
  volatile uint32_t FLASHCFG;
       uint32_t RESERVED0[31];
  volatile uint32_t PLL0CON;
  volatile uint32_t PLL0CFG;
  volatile const uint32_t PLL0STAT;
  volatile uint32_t PLL0FEED;
       uint32_t RESERVED1[4];
  volatile uint32_t PLL1CON;
  volatile uint32_t PLL1CFG;
  volatile const uint32_t PLL1STAT;
  volatile uint32_t PLL1FEED;
       uint32_t RESERVED2[4];
  volatile uint32_t PCON;
  volatile uint32_t PCONP;
       uint32_t RESERVED3[15];
  volatile uint32_t CCLKCFG;
  volatile uint32_t USBCLKCFG;
  volatile uint32_t CLKSRCSEL;
  volatile uint32_t CANSLEEPCLR;
  volatile uint32_t CANWAKEFLAGS;
       uint32_t RESERVED4[10];
  volatile uint32_t EXTINT;
       uint32_t RESERVED5;
  volatile uint32_t EXTMODE;
  volatile uint32_t EXTPOLAR;
       uint32_t RESERVED6[12];
  volatile uint32_t RSID;
       uint32_t RESERVED7[7];
  volatile uint32_t SCS;
  volatile uint32_t IRCTRIM;
  volatile uint32_t PCLKSEL0;
  volatile uint32_t PCLKSEL1;
       uint32_t RESERVED8[4];
  volatile uint32_t USBIntSt;
  volatile uint32_t DMAREQSEL;
  volatile uint32_t CLKOUTCFG;
 } LPC_SC_TypeDef;



typedef struct
{
  volatile uint32_t PINSEL0;
  volatile uint32_t PINSEL1;
  volatile uint32_t PINSEL2;
  volatile uint32_t PINSEL3;
  volatile uint32_t PINSEL4;
  volatile uint32_t PINSEL5;
  volatile uint32_t PINSEL6;
  volatile uint32_t PINSEL7;
  volatile uint32_t PINSEL8;
  volatile uint32_t PINSEL9;
  volatile uint32_t PINSEL10;
       uint32_t RESERVED0[5];
  volatile uint32_t PINMODE0;
  volatile uint32_t PINMODE1;
  volatile uint32_t PINMODE2;
  volatile uint32_t PINMODE3;
  volatile uint32_t PINMODE4;
  volatile uint32_t PINMODE5;
  volatile uint32_t PINMODE6;
  volatile uint32_t PINMODE7;
  volatile uint32_t PINMODE8;
  volatile uint32_t PINMODE9;
  volatile uint32_t PINMODE_OD0;
  volatile uint32_t PINMODE_OD1;
  volatile uint32_t PINMODE_OD2;
  volatile uint32_t PINMODE_OD3;
  volatile uint32_t PINMODE_OD4;
  volatile uint32_t I2CPADCFG;
} LPC_PINCON_TypeDef;



typedef struct
{
  union {
    volatile uint32_t FIODIR;
    struct {
      volatile uint16_t FIODIRL;
      volatile uint16_t FIODIRH;
    };
    struct {
      volatile uint8_t FIODIR0;
      volatile uint8_t FIODIR1;
      volatile uint8_t FIODIR2;
      volatile uint8_t FIODIR3;
    };
  };
  uint32_t RESERVED0[3];
  union {
    volatile uint32_t FIOMASK;
    struct {
      volatile uint16_t FIOMASKL;
      volatile uint16_t FIOMASKH;
    };
    struct {
      volatile uint8_t FIOMASK0;
      volatile uint8_t FIOMASK1;
      volatile uint8_t FIOMASK2;
      volatile uint8_t FIOMASK3;
    };
  };
  union {
    volatile uint32_t FIOPIN;
    struct {
      volatile uint16_t FIOPINL;
      volatile uint16_t FIOPINH;
    };
    struct {
      volatile uint8_t FIOPIN0;
      volatile uint8_t FIOPIN1;
      volatile uint8_t FIOPIN2;
      volatile uint8_t FIOPIN3;
    };
  };
  union {
    volatile uint32_t FIOSET;
    struct {
      volatile uint16_t FIOSETL;
      volatile uint16_t FIOSETH;
    };
    struct {
      volatile uint8_t FIOSET0;
      volatile uint8_t FIOSET1;
      volatile uint8_t FIOSET2;
      volatile uint8_t FIOSET3;
    };
  };
  union {
    volatile uint32_t FIOCLR;
    struct {
      volatile uint16_t FIOCLRL;
      volatile uint16_t FIOCLRH;
    };
    struct {
      volatile uint8_t FIOCLR0;
      volatile uint8_t FIOCLR1;
      volatile uint8_t FIOCLR2;
      volatile uint8_t FIOCLR3;
    };
  };
} LPC_GPIO_TypeDef;


typedef struct
{
  volatile const uint32_t IntStatus;
  volatile const uint32_t IO0IntStatR;
  volatile const uint32_t IO0IntStatF;
  volatile uint32_t IO0IntClr;
  volatile uint32_t IO0IntEnR;
  volatile uint32_t IO0IntEnF;
       uint32_t RESERVED0[3];
  volatile const uint32_t IO2IntStatR;
  volatile const uint32_t IO2IntStatF;
  volatile uint32_t IO2IntClr;
  volatile uint32_t IO2IntEnR;
  volatile uint32_t IO2IntEnF;
} LPC_GPIOINT_TypeDef;



typedef struct
{
  volatile uint32_t IR;
  volatile uint32_t TCR;
  volatile uint32_t TC;
  volatile uint32_t PR;
  volatile uint32_t PC;
  volatile uint32_t MCR;
  volatile uint32_t MR0;
  volatile uint32_t MR1;
  volatile uint32_t MR2;
  volatile uint32_t MR3;
  volatile uint32_t CCR;
  volatile const uint32_t CR0;
  volatile const uint32_t CR1;
       uint32_t RESERVED0[2];
  volatile uint32_t EMR;
       uint32_t RESERVED1[12];
  volatile uint32_t CTCR;
} LPC_TIM_TypeDef;



typedef struct
{
  volatile uint32_t IR;
  volatile uint32_t TCR;
  volatile uint32_t TC;
  volatile uint32_t PR;
  volatile uint32_t PC;
  volatile uint32_t MCR;
  volatile uint32_t MR0;
  volatile uint32_t MR1;
  volatile uint32_t MR2;
  volatile uint32_t MR3;
  volatile uint32_t CCR;
  volatile const uint32_t CR0;
  volatile const uint32_t CR1;
  volatile const uint32_t CR2;
  volatile const uint32_t CR3;
       uint32_t RESERVED0;
  volatile uint32_t MR4;
  volatile uint32_t MR5;
  volatile uint32_t MR6;
  volatile uint32_t PCR;
  volatile uint32_t LER;
       uint32_t RESERVED1[7];
  volatile uint32_t CTCR;
} LPC_PWM_TypeDef;



typedef struct
{
  union {
  volatile const uint8_t RBR;
  volatile uint8_t THR;
  volatile uint8_t DLL;
       uint32_t RESERVED0;
  };
  union {
  volatile uint8_t DLM;
  volatile uint32_t IER;
  };
  union {
  volatile const uint32_t IIR;
  volatile uint8_t FCR;
  };
  volatile uint8_t LCR;
       uint8_t RESERVED1[7];
  volatile const uint8_t LSR;
       uint8_t RESERVED2[7];
  volatile uint8_t SCR;
       uint8_t RESERVED3[3];
  volatile uint32_t ACR;
  volatile uint8_t ICR;
       uint8_t RESERVED4[3];
  volatile uint8_t FDR;
       uint8_t RESERVED5[7];
  volatile uint8_t TER;
       uint8_t RESERVED6[3];
} LPC_UART_TypeDef;


typedef struct
{
  union {
  volatile const uint8_t RBR;
  volatile uint8_t THR;
  volatile uint8_t DLL;
       uint32_t RESERVED0;
  };
  union {
  volatile uint8_t DLM;
       uint8_t RESERVED1[3];
  volatile uint32_t IER;
  };
  union {
  volatile const uint32_t IIR;
  volatile uint8_t FCR;
  };
  volatile uint8_t LCR;
       uint8_t RESERVED2[3];
  volatile uint8_t MCR;
       uint8_t RESERVED3[3];
  volatile const uint8_t LSR;
       uint8_t RESERVED4[3];
  volatile const uint8_t MSR;
       uint8_t RESERVED5[3];
  volatile uint8_t SCR;
       uint8_t RESERVED6[3];
  volatile uint32_t ACR;
       uint32_t RESERVED7;
  volatile uint32_t FDR;
       uint32_t RESERVED8;
  volatile uint8_t TER;
       uint8_t RESERVED9[27];
  volatile uint8_t RS485CTRL;
       uint8_t RESERVED10[3];
  volatile uint8_t ADRMATCH;
       uint8_t RESERVED11[3];
  volatile uint8_t RS485DLY;
       uint8_t RESERVED12[3];
} LPC_UART1_TypeDef;



typedef struct
{
  volatile uint32_t SPCR;
  volatile const uint32_t SPSR;
  volatile uint32_t SPDR;
  volatile uint32_t SPCCR;
       uint32_t RESERVED0[3];
  volatile uint32_t SPINT;
} LPC_SPI_TypeDef;



typedef struct
{
  volatile uint32_t CR0;
  volatile uint32_t CR1;
  volatile uint32_t DR;
  volatile const uint32_t SR;
  volatile uint32_t CPSR;
  volatile uint32_t IMSC;
  volatile uint32_t RIS;
  volatile uint32_t MIS;
  volatile uint32_t ICR;
  volatile uint32_t DMACR;
} LPC_SSP_TypeDef;



typedef struct
{
  volatile uint32_t I2CONSET;
  volatile const uint32_t I2STAT;
  volatile uint32_t I2DAT;
  volatile uint32_t I2ADR0;
  volatile uint32_t I2SCLH;
  volatile uint32_t I2SCLL;
  volatile uint32_t I2CONCLR;
  volatile uint32_t MMCTRL;
  volatile uint32_t I2ADR1;
  volatile uint32_t I2ADR2;
  volatile uint32_t I2ADR3;
  volatile const uint32_t I2DATA_BUFFER;
  volatile uint32_t I2MASK0;
  volatile uint32_t I2MASK1;
  volatile uint32_t I2MASK2;
  volatile uint32_t I2MASK3;
} LPC_I2C_TypeDef;



typedef struct
{
  volatile uint32_t I2SDAO;
  volatile uint32_t I2SDAI;
  volatile uint32_t I2STXFIFO;
  volatile const uint32_t I2SRXFIFO;
  volatile const uint32_t I2SSTATE;
  volatile uint32_t I2SDMA1;
  volatile uint32_t I2SDMA2;
  volatile uint32_t I2SIRQ;
  volatile uint32_t I2STXRATE;
  volatile uint32_t I2SRXRATE;
  volatile uint32_t I2STXBITRATE;
  volatile uint32_t I2SRXBITRATE;
  volatile uint32_t I2STXMODE;
  volatile uint32_t I2SRXMODE;
} LPC_I2S_TypeDef;



typedef struct
{
  volatile uint32_t RICOMPVAL;
  volatile uint32_t RIMASK;
  volatile uint8_t RICTRL;
       uint8_t RESERVED0[3];
  volatile uint32_t RICOUNTER;
} LPC_RIT_TypeDef;



typedef struct
{
  volatile uint8_t ILR;
       uint8_t RESERVED0[7];
  volatile uint8_t CCR;
       uint8_t RESERVED1[3];
  volatile uint8_t CIIR;
       uint8_t RESERVED2[3];
  volatile uint8_t AMR;
       uint8_t RESERVED3[3];
  volatile const uint32_t CTIME0;
  volatile const uint32_t CTIME1;
  volatile const uint32_t CTIME2;
  volatile uint8_t SEC;
       uint8_t RESERVED4[3];
  volatile uint8_t MIN;
       uint8_t RESERVED5[3];
  volatile uint8_t HOUR;
       uint8_t RESERVED6[3];
  volatile uint8_t DOM;
       uint8_t RESERVED7[3];
  volatile uint8_t DOW;
       uint8_t RESERVED8[3];
  volatile uint16_t DOY;
       uint16_t RESERVED9;
  volatile uint8_t MONTH;
       uint8_t RESERVED10[3];
  volatile uint16_t YEAR;
       uint16_t RESERVED11;
  volatile uint32_t CALIBRATION;
  volatile uint32_t GPREG0;
  volatile uint32_t GPREG1;
  volatile uint32_t GPREG2;
  volatile uint32_t GPREG3;
  volatile uint32_t GPREG4;
  volatile uint8_t RTC_AUXEN;
       uint8_t RESERVED12[3];
  volatile uint8_t RTC_AUX;
       uint8_t RESERVED13[3];
  volatile uint8_t ALSEC;
       uint8_t RESERVED14[3];
  volatile uint8_t ALMIN;
       uint8_t RESERVED15[3];
  volatile uint8_t ALHOUR;
       uint8_t RESERVED16[3];
  volatile uint8_t ALDOM;
       uint8_t RESERVED17[3];
  volatile uint8_t ALDOW;
       uint8_t RESERVED18[3];
  volatile uint16_t ALDOY;
       uint16_t RESERVED19;
  volatile uint8_t ALMON;
       uint8_t RESERVED20[3];
  volatile uint16_t ALYEAR;
       uint16_t RESERVED21;
} LPC_RTC_TypeDef;



typedef struct
{
  volatile uint8_t WDMOD;
       uint8_t RESERVED0[3];
  volatile uint32_t WDTC;
  volatile uint8_t WDFEED;
       uint8_t RESERVED1[3];
  volatile const uint32_t WDTV;
  volatile uint32_t WDCLKSEL;
} LPC_WDT_TypeDef;



typedef struct
{
  volatile uint32_t ADCR;
  volatile uint32_t ADGDR;
       uint32_t RESERVED0;
  volatile uint32_t ADINTEN;
  volatile const uint32_t ADDR0;
  volatile const uint32_t ADDR1;
  volatile const uint32_t ADDR2;
  volatile const uint32_t ADDR3;
  volatile const uint32_t ADDR4;
  volatile const uint32_t ADDR5;
  volatile const uint32_t ADDR6;
  volatile const uint32_t ADDR7;
  volatile const uint32_t ADSTAT;
  volatile uint32_t ADTRM;
} LPC_ADC_TypeDef;



typedef struct
{
  volatile uint32_t DACR;
  volatile uint32_t DACCTRL;
  volatile uint16_t DACCNTVAL;
       uint16_t RESERVED;
} LPC_DAC_TypeDef;



typedef struct
{
  volatile const uint32_t MCCON;
  volatile uint32_t MCCON_SET;
  volatile uint32_t MCCON_CLR;
  volatile const uint32_t MCCAPCON;
  volatile uint32_t MCCAPCON_SET;
  volatile uint32_t MCCAPCON_CLR;
  volatile uint32_t MCTIM0;
  volatile uint32_t MCTIM1;
  volatile uint32_t MCTIM2;
  volatile uint32_t MCPER0;
  volatile uint32_t MCPER1;
  volatile uint32_t MCPER2;
  volatile uint32_t MCPW0;
  volatile uint32_t MCPW1;
  volatile uint32_t MCPW2;
  volatile uint32_t MCDEADTIME;
  volatile uint32_t MCCCP;
  volatile uint32_t MCCR0;
  volatile uint32_t MCCR1;
  volatile uint32_t MCCR2;
  volatile const uint32_t MCINTEN;
  volatile uint32_t MCINTEN_SET;
  volatile uint32_t MCINTEN_CLR;
  volatile const uint32_t MCCNTCON;
  volatile uint32_t MCCNTCON_SET;
  volatile uint32_t MCCNTCON_CLR;
  volatile const uint32_t MCINTFLAG;
  volatile uint32_t MCINTFLAG_SET;
  volatile uint32_t MCINTFLAG_CLR;
  volatile uint32_t MCCAP_CLR;
} LPC_MCPWM_TypeDef;



typedef struct
{
  volatile uint32_t QEICON;
  volatile const uint32_t QEISTAT;
  volatile uint32_t QEICONF;
  volatile const uint32_t QEIPOS;
  volatile uint32_t QEIMAXPOS;
  volatile uint32_t CMPOS0;
  volatile uint32_t CMPOS1;
  volatile uint32_t CMPOS2;
  volatile const uint32_t INXCNT;
  volatile uint32_t INXCMP;
  volatile uint32_t QEILOAD;
  volatile const uint32_t QEITIME;
  volatile const uint32_t QEIVEL;
  volatile const uint32_t QEICAP;
  volatile uint32_t VELCOMP;
  volatile uint32_t FILTER;
       uint32_t RESERVED0[998];
  volatile uint32_t QEIIEC;
  volatile uint32_t QEIIES;
  volatile const uint32_t QEIINTSTAT;
  volatile const uint32_t QEIIE;
  volatile uint32_t QEICLR;
  volatile uint32_t QEISET;
} LPC_QEI_TypeDef;



typedef struct
{
  volatile uint32_t mask[512];
} LPC_CANAF_RAM_TypeDef;


typedef struct
{
  volatile uint32_t AFMR;
  volatile uint32_t SFF_sa;
  volatile uint32_t SFF_GRP_sa;
  volatile uint32_t EFF_sa;
  volatile uint32_t EFF_GRP_sa;
  volatile uint32_t ENDofTable;
  volatile const uint32_t LUTerrAd;
  volatile const uint32_t LUTerr;
  volatile uint32_t FCANIE;
  volatile uint32_t FCANIC0;
  volatile uint32_t FCANIC1;
} LPC_CANAF_TypeDef;


typedef struct
{
  volatile const uint32_t CANTxSR;
  volatile const uint32_t CANRxSR;
  volatile const uint32_t CANMSR;
} LPC_CANCR_TypeDef;


typedef struct
{
  volatile uint32_t MOD;
  volatile uint32_t CMR;
  volatile uint32_t GSR;
  volatile const uint32_t ICR;
  volatile uint32_t IER;
  volatile uint32_t BTR;
  volatile uint32_t EWL;
  volatile const uint32_t SR;
  volatile uint32_t RFS;
  volatile uint32_t RID;
  volatile uint32_t RDA;
  volatile uint32_t RDB;
  volatile uint32_t TFI1;
  volatile uint32_t TID1;
  volatile uint32_t TDA1;
  volatile uint32_t TDB1;
  volatile uint32_t TFI2;
  volatile uint32_t TID2;
  volatile uint32_t TDA2;
  volatile uint32_t TDB2;
  volatile uint32_t TFI3;
  volatile uint32_t TID3;
  volatile uint32_t TDA3;
  volatile uint32_t TDB3;
} LPC_CAN_TypeDef;



typedef struct
{
  volatile const uint32_t DMACIntStat;
  volatile const uint32_t DMACIntTCStat;
  volatile uint32_t DMACIntTCClear;
  volatile const uint32_t DMACIntErrStat;
  volatile uint32_t DMACIntErrClr;
  volatile const uint32_t DMACRawIntTCStat;
  volatile const uint32_t DMACRawIntErrStat;
  volatile const uint32_t DMACEnbldChns;
  volatile uint32_t DMACSoftBReq;
  volatile uint32_t DMACSoftSReq;
  volatile uint32_t DMACSoftLBReq;
  volatile uint32_t DMACSoftLSReq;
  volatile uint32_t DMACConfig;
  volatile uint32_t DMACSync;
} LPC_GPDMA_TypeDef;


typedef struct
{
  volatile uint32_t DMACCSrcAddr;
  volatile uint32_t DMACCDestAddr;
  volatile uint32_t DMACCLLI;
  volatile uint32_t DMACCControl;
  volatile uint32_t DMACCConfig;
} LPC_GPDMACH_TypeDef;



typedef struct
{
  volatile const uint32_t HcRevision;
  volatile uint32_t HcControl;
  volatile uint32_t HcCommandStatus;
  volatile uint32_t HcInterruptStatus;
  volatile uint32_t HcInterruptEnable;
  volatile uint32_t HcInterruptDisable;
  volatile uint32_t HcHCCA;
  volatile const uint32_t HcPeriodCurrentED;
  volatile uint32_t HcControlHeadED;
  volatile uint32_t HcControlCurrentED;
  volatile uint32_t HcBulkHeadED;
  volatile uint32_t HcBulkCurrentED;
  volatile const uint32_t HcDoneHead;
  volatile uint32_t HcFmInterval;
  volatile const uint32_t HcFmRemaining;
  volatile const uint32_t HcFmNumber;
  volatile uint32_t HcPeriodicStart;
  volatile uint32_t HcLSTreshold;
  volatile uint32_t HcRhDescriptorA;
  volatile uint32_t HcRhDescriptorB;
  volatile uint32_t HcRhStatus;
  volatile uint32_t HcRhPortStatus1;
  volatile uint32_t HcRhPortStatus2;
       uint32_t RESERVED0[40];
  volatile const uint32_t Module_ID;

  volatile const uint32_t OTGIntSt;
  volatile uint32_t OTGIntEn;
  volatile uint32_t OTGIntSet;
  volatile uint32_t OTGIntClr;
  volatile uint32_t OTGStCtrl;
  volatile uint32_t OTGTmr;
       uint32_t RESERVED1[58];

  volatile const uint32_t USBDevIntSt;
  volatile uint32_t USBDevIntEn;
  volatile uint32_t USBDevIntClr;
  volatile uint32_t USBDevIntSet;

  volatile uint32_t USBCmdCode;
  volatile const uint32_t USBCmdData;

  volatile const uint32_t USBRxData;
  volatile uint32_t USBTxData;
  volatile const uint32_t USBRxPLen;
  volatile uint32_t USBTxPLen;
  volatile uint32_t USBCtrl;
  volatile uint32_t USBDevIntPri;

  volatile const uint32_t USBEpIntSt;
  volatile uint32_t USBEpIntEn;
  volatile uint32_t USBEpIntClr;
  volatile uint32_t USBEpIntSet;
  volatile uint32_t USBEpIntPri;

  volatile uint32_t USBReEp;
  volatile uint32_t USBEpInd;
  volatile uint32_t USBMaxPSize;

  volatile const uint32_t USBDMARSt;
  volatile uint32_t USBDMARClr;
  volatile uint32_t USBDMARSet;
       uint32_t RESERVED2[9];
  volatile uint32_t USBUDCAH;
  volatile const uint32_t USBEpDMASt;
  volatile uint32_t USBEpDMAEn;
  volatile uint32_t USBEpDMADis;
  volatile const uint32_t USBDMAIntSt;
  volatile uint32_t USBDMAIntEn;
       uint32_t RESERVED3[2];
  volatile const uint32_t USBEoTIntSt;
  volatile uint32_t USBEoTIntClr;
  volatile uint32_t USBEoTIntSet;
  volatile const uint32_t USBNDDRIntSt;
  volatile uint32_t USBNDDRIntClr;
  volatile uint32_t USBNDDRIntSet;
  volatile const uint32_t USBSysErrIntSt;
  volatile uint32_t USBSysErrIntClr;
  volatile uint32_t USBSysErrIntSet;
       uint32_t RESERVED4[15];

  union {
  volatile const uint32_t I2C_RX;
  volatile uint32_t I2C_TX;
  };
  volatile const uint32_t I2C_STS;
  volatile uint32_t I2C_CTL;
  volatile uint32_t I2C_CLKHI;
  volatile uint32_t I2C_CLKLO;
       uint32_t RESERVED5[824];

  union {
  volatile uint32_t USBClkCtrl;
  volatile uint32_t OTGClkCtrl;
  };
  union {
  volatile const uint32_t USBClkSt;
  volatile const uint32_t OTGClkSt;
  };
} LPC_USB_TypeDef;



typedef struct
{
  volatile uint32_t MAC1;
  volatile uint32_t MAC2;
  volatile uint32_t IPGT;
  volatile uint32_t IPGR;
  volatile uint32_t CLRT;
  volatile uint32_t MAXF;
  volatile uint32_t SUPP;
  volatile uint32_t TEST;
  volatile uint32_t MCFG;
  volatile uint32_t MCMD;
  volatile uint32_t MADR;
  volatile uint32_t MWTD;
  volatile const uint32_t MRDD;
  volatile const uint32_t MIND;
       uint32_t RESERVED0[2];
  volatile uint32_t SA0;
  volatile uint32_t SA1;
  volatile uint32_t SA2;
       uint32_t RESERVED1[45];
  volatile uint32_t Command;
  volatile const uint32_t Status;
  volatile uint32_t RxDescriptor;
  volatile uint32_t RxStatus;
  volatile uint32_t RxDescriptorNumber;
  volatile const uint32_t RxProduceIndex;
  volatile uint32_t RxConsumeIndex;
  volatile uint32_t TxDescriptor;
  volatile uint32_t TxStatus;
  volatile uint32_t TxDescriptorNumber;
  volatile uint32_t TxProduceIndex;
  volatile const uint32_t TxConsumeIndex;
       uint32_t RESERVED2[10];
  volatile const uint32_t TSV0;
  volatile const uint32_t TSV1;
  volatile const uint32_t RSV;
       uint32_t RESERVED3[3];
  volatile uint32_t FlowControlCounter;
  volatile const uint32_t FlowControlStatus;
       uint32_t RESERVED4[34];
  volatile uint32_t RxFilterCtrl;
  volatile uint32_t RxFilterWoLStatus;
  volatile uint32_t RxFilterWoLClear;
       uint32_t RESERVED5;
  volatile uint32_t HashFilterL;
  volatile uint32_t HashFilterH;
       uint32_t RESERVED6[882];
  volatile const uint32_t IntStatus;
  volatile uint32_t IntEnable;
  volatile uint32_t IntClear;
  volatile uint32_t IntSet;
       uint32_t RESERVED7;
  volatile uint32_t PowerDown;
       uint32_t RESERVED8;
  volatile uint32_t Module_ID;
} LPC_EMAC_TypeDef;
# 27 "Source\\GLCD/GLCD.h" 2
# 90 "Source\\GLCD/GLCD.h"
void LCD_Initialization(void);
void LCD_Clear(uint16_t Color);
uint16_t LCD_GetPoint(uint16_t Xpos,uint16_t Ypos);
void LCD_SetPoint(uint16_t Xpos,uint16_t Ypos,uint16_t point);
void LCD_DrawLine( uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1 , uint16_t color );
void PutChar( uint16_t Xpos, uint16_t Ypos, uint8_t ASCI, uint16_t charColor, uint16_t bkColor );
void GUI_Text(uint16_t Xpos, uint16_t Ypos, uint8_t *str,uint16_t Color, uint16_t bkColor);
# 6 "Source\\game.h" 2


//Dimensioni e Costanti di Gioco







// offset per la griglia
// Margine sinistro di 5 pixel, Margine alto di 10 pixel



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

// Colori Tetris RGB565
// Formato: 5 bit Rosso, 6 bit Verde, 5 bit Blu
// I nomi iniziano con T_ per distinguerli da quelli di sistema
# 45 "Source\\game.h"
// Colori di utilità





// --- Strutture Dati ---

// Un punto nella griglia
typedef struct {
    int riga;
    int colonna;
} Punto;

// Definizione di un Tetramino
typedef struct {
    Punto celle[4]; // Ogni blocco è formato da 4 celle
    Punto posizione; // Posizione (riga, colonna) del pivot del blocco nella griglia
    uint16_t colore; // Colore del blocco (usiamo i colori definiti in GLCD.h)
    TipoBlocco tipo; // Tipo di blocco
    int rotazione; // Stato di rotazione (0, 1, 2, 3)
} Tetramino;

// Variabili Globali Esterne (accessibili da main e interrupt)
extern uint16_t griglia[20 // Righe della griglia di gioco][10 // Colonne]; // Matrice che rappresenta la griglia (contiene i colori)
extern Tetramino tetraminoCorrente; // Il blocco che sta cadendo
extern Tetramino tetraminoSuccessivo; // Il prossimo blocco (per la preview)
extern volatile StatoGioco stato_gioco; // Stato corrente del gioco
extern int punteggio; // Punteggio corrente

// Prototipi di Funzione
void inizializza_gioco(void); // Inizializza variabili e schermo
void aggiorna_gioco(void); // Logica principale (chiamata dal timer)
void genera_blocco(void); // Genera un nuovo blocco
void disegna_griglia_statica(void); // Disegna i contorni statici
extern volatile int mod_caduta_rapida;
extern void alla_pressione_tasto1(void);
# 2 "Source/game.c" 2

# 1 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 1 3
# 71 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
    typedef unsigned int size_t;
# 91 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
    typedef unsigned short wchar_t;




typedef struct div_t { int quot, rem; } div_t;

typedef struct ldiv_t { long int quot, rem; } ldiv_t;
# 139 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int __aeabi_MB_CUR_MAX(void);
# 158 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) double atof(const char * ) __attribute__((__nonnull__(1)));





extern __attribute__((__nothrow__)) int atoi(const char * ) __attribute__((__nonnull__(1)));





extern __attribute__((__nothrow__)) long int atol(const char * ) __attribute__((__nonnull__(1)));
# 185 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) double strtod(const char * __restrict , char ** __restrict ) __attribute__((__nonnull__(1)));
# 212 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) long int strtol(const char * __restrict ,
                        char ** __restrict , int ) __attribute__((__nonnull__(1)));
# 243 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) unsigned long int strtoul(const char * __restrict ,
                                       char ** __restrict , int ) __attribute__((__nonnull__(1)));
# 275 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) long long strtoll(const char * __restrict ,
                                  char ** __restrict , int )
                          __attribute__((__nonnull__(1)));






extern __attribute__((__nothrow__)) unsigned long long strtoull(const char * __restrict ,
                                            char ** __restrict , int )
                                   __attribute__((__nonnull__(1)));






extern __attribute__((__nothrow__)) int rand(void);
# 303 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) void srand(unsigned int );
# 313 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
struct _rand_state { int __x[57]; };
extern __attribute__((__nothrow__)) int _rand_r(struct _rand_state *);
extern __attribute__((__nothrow__)) void _srand_r(struct _rand_state *, unsigned int);
struct _ANSI_rand_state { int __x[1]; };
extern __attribute__((__nothrow__)) int _ANSI_rand_r(struct _ANSI_rand_state *);
extern __attribute__((__nothrow__)) void _ANSI_srand_r(struct _ANSI_rand_state *, unsigned int);





extern __attribute__((__nothrow__)) void *calloc(size_t , size_t );





extern __attribute__((__nothrow__)) void free(void * );







extern __attribute__((__nothrow__)) void *malloc(size_t );





extern __attribute__((__nothrow__)) void *realloc(void * , size_t );
# 374 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
typedef int (*__heapprt)(void *, char const *, ...);
extern __attribute__((__nothrow__)) void __heapstats(int (* )(void * ,
                                           char const * , ...),
                        void * ) __attribute__((__nonnull__(1)));
# 390 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int __heapvalid(int (* )(void * ,
                                           char const * , ...),
                       void * , int ) __attribute__((__nonnull__(1)));
# 411 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__noreturn__)) void abort(void);
# 422 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int atexit(void (* )(void)) __attribute__((__nonnull__(1)));
# 444 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__noreturn__)) void exit(int );
# 460 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__noreturn__)) void _Exit(int );
# 471 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) char *getenv(const char * ) __attribute__((__nonnull__(1)));
# 484 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int system(const char * );
# 497 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern void *bsearch(const void * , const void * ,
              size_t , size_t ,
              int (* )(const void *, const void *)) __attribute__((__nonnull__(1,2,5)));
# 532 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern void qsort(void * , size_t , size_t ,
           int (* )(const void *, const void *)) __attribute__((__nonnull__(1,4)));
# 560 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__const__)) int abs(int );






extern __attribute__((__nothrow__)) __attribute__((__const__)) div_t div(int , int );
# 579 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__const__)) long int labs(long int );
# 589 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__const__)) ldiv_t ldiv(long int , long int );
# 644 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
typedef struct __sdiv32by16 { long quot, rem; } __sdiv32by16;
typedef struct __udiv32by16 { unsigned long quot, rem; } __udiv32by16;

typedef struct __sdiv64by32 { long rem, quot; } __sdiv64by32;

__attribute__((__value_in_regs__)) extern __attribute__((__nothrow__)) __attribute__((__const__)) __sdiv32by16 __rt_sdiv32by16(
     int ,
     short int );



__attribute__((__value_in_regs__)) extern __attribute__((__nothrow__)) __attribute__((__const__)) __udiv32by16 __rt_udiv32by16(
     unsigned int ,
     unsigned short );



__attribute__((__value_in_regs__)) extern __attribute__((__nothrow__)) __attribute__((__const__)) __sdiv64by32 __rt_sdiv64by32(
     int , unsigned int ,
     int );







extern __attribute__((__nothrow__)) unsigned int __fp_status(unsigned int , unsigned int );
# 705 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int mblen(const char * , size_t );
# 720 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int mbtowc(wchar_t * __restrict ,
                   const char * __restrict , size_t );
# 739 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int wctomb(char * , wchar_t );
# 761 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) size_t mbstowcs(wchar_t * __restrict ,
                      const char * __restrict , size_t ) __attribute__((__nonnull__(2)));
# 779 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) size_t wcstombs(char * __restrict ,
                      const wchar_t * __restrict , size_t ) __attribute__((__nonnull__(2)));
# 798 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) void __use_realtime_heap(void);
extern __attribute__((__nothrow__)) void __use_realtime_division(void);
extern __attribute__((__nothrow__)) void __use_two_region_memory(void);
extern __attribute__((__nothrow__)) void __use_no_heap(void);
extern __attribute__((__nothrow__)) void __use_no_heap_region(void);

extern __attribute__((__nothrow__)) char const *__C_library_version_string(void);
extern __attribute__((__nothrow__)) int __C_library_version_number(void);
# 4 "Source/game.c" 2
# 1 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 1 3
# 68 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
    typedef __builtin_va_list __va_list;
# 87 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
typedef struct __fpos_t_struct {
    unsigned long long int __pos;





    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
# 108 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
typedef struct __FILE FILE;
# 119 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
struct __FILE {
    union {
        long __FILE_alignment;



        char __FILE_size[84];

    } __FILE_opaque;
};
# 138 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern FILE __stdin, __stdout, __stderr;
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;
# 224 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int remove(const char * ) __attribute__((__nonnull__(1)));







extern __attribute__((__nothrow__)) int rename(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 243 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) FILE *tmpfile(void);






extern __attribute__((__nothrow__)) char *tmpnam(char * );
# 265 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fclose(FILE * ) __attribute__((__nonnull__(1)));
# 275 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fflush(FILE * );
# 285 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) FILE *fopen(const char * __restrict ,
                           const char * __restrict ) __attribute__((__nonnull__(1,2)));
# 329 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) FILE *freopen(const char * __restrict ,
                    const char * __restrict ,
                    FILE * __restrict ) __attribute__((__nonnull__(2,3)));
# 342 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) void setbuf(FILE * __restrict ,
                    char * __restrict ) __attribute__((__nonnull__(1)));






extern __attribute__((__nothrow__)) int setvbuf(FILE * __restrict ,
                   char * __restrict ,
                   int , size_t ) __attribute__((__nonnull__(1)));
# 370 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((__nothrow__)) int fprintf(FILE * __restrict ,
                    const char * __restrict , ...) __attribute__((__nonnull__(1,2)));
# 393 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((__nothrow__)) int _fprintf(FILE * __restrict ,
                     const char * __restrict , ...) __attribute__((__nonnull__(1,2)));





#pragma __printf_args
extern __attribute__((__nothrow__)) int printf(const char * __restrict , ...) __attribute__((__nonnull__(1)));






#pragma __printf_args
extern __attribute__((__nothrow__)) int _printf(const char * __restrict , ...) __attribute__((__nonnull__(1)));





#pragma __printf_args
extern __attribute__((__nothrow__)) int sprintf(char * __restrict , const char * __restrict , ...) __attribute__((__nonnull__(1,2)));








#pragma __printf_args
extern __attribute__((__nothrow__)) int _sprintf(char * __restrict , const char * __restrict , ...) __attribute__((__nonnull__(1,2)));






#pragma __printf_args
extern __attribute__((__nothrow__)) int __ARM_snprintf(char * __restrict , size_t ,
                     const char * __restrict , ...) __attribute__((__nonnull__(3)));
# 460 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((__nothrow__)) int _snprintf(char * __restrict , size_t ,
                      const char * __restrict , ...) __attribute__((__nonnull__(3)));





#pragma __scanf_args
extern __attribute__((__nothrow__)) int fscanf(FILE * __restrict ,
                    const char * __restrict , ...) __attribute__((__nonnull__(1,2)));
# 503 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
#pragma __scanf_args
extern __attribute__((__nothrow__)) int _fscanf(FILE * __restrict ,
                     const char * __restrict , ...) __attribute__((__nonnull__(1,2)));





#pragma __scanf_args
extern __attribute__((__nothrow__)) int scanf(const char * __restrict , ...) __attribute__((__nonnull__(1)));








#pragma __scanf_args
extern __attribute__((__nothrow__)) int _scanf(const char * __restrict , ...) __attribute__((__nonnull__(1)));





#pragma __scanf_args
extern __attribute__((__nothrow__)) int sscanf(const char * __restrict ,
                    const char * __restrict , ...) __attribute__((__nonnull__(1,2)));
# 541 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
#pragma __scanf_args
extern __attribute__((__nothrow__)) int _sscanf(const char * __restrict ,
                     const char * __restrict , ...) __attribute__((__nonnull__(1,2)));
# 555 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int _vfscanf(FILE * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) int _vscanf(const char * __restrict , __va_list) __attribute__((__nonnull__(1)));
extern __attribute__((__nothrow__)) int _vsscanf(const char * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) int __ARM_vsscanf(const char * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));

extern __attribute__((__nothrow__)) int vprintf(const char * __restrict , __va_list ) __attribute__((__nonnull__(1)));







extern __attribute__((__nothrow__)) int _vprintf(const char * __restrict , __va_list ) __attribute__((__nonnull__(1)));





extern __attribute__((__nothrow__)) int vfprintf(FILE * __restrict ,
                    const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));
# 584 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int vsprintf(char * __restrict ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));
# 594 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int __ARM_vsnprintf(char * __restrict , size_t ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(3)));
# 609 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int _vsprintf(char * __restrict ,
                      const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));





extern __attribute__((__nothrow__)) int _vfprintf(FILE * __restrict ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));





extern __attribute__((__nothrow__)) int _vsnprintf(char * __restrict , size_t ,
                      const char * __restrict , __va_list ) __attribute__((__nonnull__(3)));
# 635 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((__nothrow__)) int __ARM_asprintf(char ** , const char * __restrict , ...) __attribute__((__nonnull__(2)));
extern __attribute__((__nothrow__)) int __ARM_vasprintf(char ** , const char * __restrict , __va_list ) __attribute__((__nonnull__(2)));
# 649 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fgetc(FILE * ) __attribute__((__nonnull__(1)));
# 659 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) char *fgets(char * __restrict , int ,
                    FILE * __restrict ) __attribute__((__nonnull__(1,3)));
# 673 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fputc(int , FILE * ) __attribute__((__nonnull__(2)));
# 683 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fputs(const char * __restrict , FILE * __restrict ) __attribute__((__nonnull__(1,2)));






extern __attribute__((__nothrow__)) int getc(FILE * ) __attribute__((__nonnull__(1)));
# 704 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
    extern __attribute__((__nothrow__)) int (getchar)(void);
# 713 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) char *gets(char * ) __attribute__((__nonnull__(1)));
# 725 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int putc(int , FILE * ) __attribute__((__nonnull__(2)));
# 737 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
    extern __attribute__((__nothrow__)) int (putchar)(int );






extern __attribute__((__nothrow__)) int puts(const char * ) __attribute__((__nonnull__(1)));







extern __attribute__((__nothrow__)) int ungetc(int , FILE * ) __attribute__((__nonnull__(2)));
# 778 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) size_t fread(void * __restrict ,
                    size_t , size_t , FILE * __restrict ) __attribute__((__nonnull__(1,4)));
# 794 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) size_t __fread_bytes_avail(void * __restrict ,
                    size_t , FILE * __restrict ) __attribute__((__nonnull__(1,3)));
# 810 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) size_t fwrite(const void * __restrict ,
                    size_t , size_t , FILE * __restrict ) __attribute__((__nonnull__(1,4)));
# 822 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fgetpos(FILE * __restrict , fpos_t * __restrict ) __attribute__((__nonnull__(1,2)));
# 833 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fseek(FILE * , long int , int ) __attribute__((__nonnull__(1)));
# 850 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fsetpos(FILE * __restrict , const fpos_t * __restrict ) __attribute__((__nonnull__(1,2)));
# 863 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) long int ftell(FILE * ) __attribute__((__nonnull__(1)));
# 877 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) void rewind(FILE * ) __attribute__((__nonnull__(1)));
# 886 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) void clearerr(FILE * ) __attribute__((__nonnull__(1)));







extern __attribute__((__nothrow__)) int feof(FILE * ) __attribute__((__nonnull__(1)));




extern __attribute__((__nothrow__)) int ferror(FILE * ) __attribute__((__nonnull__(1)));




extern __attribute__((__nothrow__)) void perror(const char * );
# 917 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int _fisatty(FILE * ) __attribute__((__nonnull__(1)));



extern __attribute__((__nothrow__)) void __use_no_semihosting_swi(void);
extern __attribute__((__nothrow__)) void __use_no_semihosting(void);
# 5 "Source/game.c" 2
# 1 "Source\\music/music.h" 1




//Default: 1.65







typedef char BOOL;



typedef enum note_durations
{
 time_semibiscroma = (unsigned int)(0x17D7840 * 1 * 1.6 / 64.0f + 0.5), // 1/128
 time_biscroma = (unsigned int)(0x17D7840 * 1 * 1.6 / 32.0f + 0.5), // 1/64
 time_semicroma = (unsigned int)(0x17D7840 * 1 * 1.6 / 16.0f + 0.5), // 1/32
 time_croma = (unsigned int)(0x17D7840 * 1 * 1.6 / 8.0f + 0.5), // 1/16
 time_semiminima = (unsigned int)(0x17D7840 * 1 * 1.6 / 4.0f + 0.5), // 1/4
 time_minima = (unsigned int)(0x17D7840 * 1 * 1.6 / 2.0f + 0.5), // 1/2
 time_semibreve = (unsigned int)(0x17D7840 * 1 * 1.6 + 0.5), // 1
} NOTE_DURATION;

typedef enum frequencies
{
 a2b = 5351, // 103Hz k=5351 a2b
 b2 = 4500, // 123Hz k=4500 b2
 c3b = 4370, // 127Hz k)4370 c3b
 c3 = 4240, // 131Hz k=4240 c3
 d3 = 3779, // 147Hz k=3779 d3
 e3 = 3367, // 165Hz k=3367 e3
 f3 = 3175, // 175Hz k=3175 f3
 g3 = 2834, // 196Hz k=2834 g3
 a3b = 2670, // 208Hz k=2670 a4b
 a3 = 2525, // 220Hz k=2525 a3
 b3 = 2249, // 247Hz k=2249 b3
 c4 = 2120, // 262Hz k=2120 c4
 d4 = 1890, // 294Hz k=1890 d4
 e4 = 1684, // 330Hz k=1684 e4
 f4 = 1592, // 349Hz k=1592 f4
 g4 = 1417, // 392Hz k=1417 g4
 a4 = 1263, // 440Hz k=1263 a4
 b4 = 1125, // 494Hz k=1125 b4
 c5 = 1062, // 523Hz k=1062 c5
 pause = 0 // DO NOT SOUND
} FREQUENCY;


typedef struct
{
 FREQUENCY freq;
 NOTE_DURATION duration;
} NOTE;

void playNote(NOTE note);
BOOL isNotePlaying(void);
# 6 "Source/game.c" 2
# 1 "Source\\timer/timer.h" 1
# 15 "Source\\timer/timer.h"
//uint32_t init_timer ( uint8_t timer_num, uint32_t Prescaler, uint8_t MatchReg, uint8_t SRImatchReg, uint32_t TimerInterval )
//extern uint32_t init_timer( uint8_t timer_num, uint32_t timerInterval );
extern uint32_t init_timer( uint8_t timer_num, uint32_t Prescaler, uint8_t MatchReg, uint8_t SRImatchReg, uint32_t TimerInterval );
extern void enable_timer( uint8_t timer_num );
extern void disable_timer( uint8_t timer_num );
extern void reset_timer( uint8_t timer_num );
void toggle_timer( uint8_t timer_num );
unsigned int get_timer_value(uint8_t timer_num);
uint32_t is_timer_enabled ( uint8_t timer_num);
void power_on_timer2();
void power_on_timer3();
float get_timer_value_in_sec(uint8_t timer_num);


extern void TIMER0_IRQHandler (void);
extern void TIMER1_IRQHandler (void);
extern void TIMER2_IRQHandler (void);
extern void TIMER3_IRQHandler (void);
# 7 "Source/game.c" 2

// Variabili Globali
uint16_t griglia[20 // Righe della griglia di gioco][10 // Colonne];
Tetramino tetraminoCorrente;
Tetramino tetraminoSuccessivo;
volatile StatoGioco stato_gioco = GIOCO_IN_PAUSA;

int punteggio = 0;
int linee_completate_totali = 0;
volatile int record_punteggio = 0;
volatile int mod_caduta_rapida = 0;
volatile int richiesta_riavvio = 0;

// Variabili Esterne
extern volatile int J_left;
extern volatile int J_right;
extern volatile int J_up;
extern volatile int J_down;

// SPARTITO MUSICALE TETRIS
NOTE tetris_theme[] = {
    // Parte 1
    {e4, time_semiminima}, {b3, time_croma}, {c4, time_croma}, {d4, time_semiminima},
    {c4, time_croma}, {b3, time_croma}, {a3, time_semiminima}, {a3, time_croma},
    {c4, time_croma}, {e4, time_semiminima}, {d4, time_croma}, {c4, time_croma},
    {b3, time_semiminima}, {b3, time_croma}, {c4, time_croma}, {d4, time_semiminima},
    {e4, time_semiminima}, {c4, time_semiminima}, {a3, time_semiminima}, {a3, time_semiminima},
    {pause, time_croma}, // Pausa breve

    // Parte 2
    {d4, time_semiminima}, {f4, time_croma}, {a4, time_semiminima}, {g4, time_croma}, {f4, time_croma},
    {e4, time_semiminima}, {c4, time_croma}, {e4, time_semiminima}, {d4, time_croma}, {c4, time_croma},
    {b3, time_semiminima}, {b3, time_croma}, {c4, time_croma}, {d4, time_semiminima}, {e4, time_semiminima},
    {c4, time_semiminima}, {a3, time_semiminima}, {a3, time_semiminima},

    {pause, 0} // Indica la fine della canzone (loop)
};

// Forme dei blocchi
const Punto FORME_TETRAMINI[7][4] = {
    {{0, -1}, {0, 0}, {0, 1}, {0, 2}}, // I
    {{0, -1}, {0, 0}, {0, 1}, {1, 1}}, // J
    {{0, -1}, {0, 0}, {0, 1}, {1, -1}}, // L
    {{0, 0}, {0, 1}, {1, 0}, {1, 1}}, // O
    {{0, -1}, {0, 0}, {1, 0}, {1, 1}}, // S
    {{0, -1}, {0, 0}, {0, 1}, {1, 0}}, // T
    {{0, 1}, {0, 0}, {1, 0}, {1, -1}} // Z
};

const uint16_t COLORI_TETRAMINI[7] = {
    0x07FF // Ciano (I piece) - R=0, G=63, B=31 (Nota: 0x7FFF è ciano chiaro, 0x07FF è puro ciano standard), 0x001F // Blu (J piece) - R=0, G=0, B=31, 0xFD20 // Arancione (L piece) - R=31, G=40, B=0, 0xFFE0 // Giallo (O piece) - R=31, G=63, B=0, 0x07E0 // Verde (S piece) - R=0, G=63, B=0, 0xF81F // 0xF81F (T piece) - R=31, G=0, B=31, 0xF800 // Rosso (Z piece) - R=31, G=0, B=0
};

// --- Funzioni di Disegno (Invariate) ---

void disegna_cella_griglia(int riga, int colonna, uint16_t colore) {
    int x0 = 5 + (colonna * 15 // Dimensione in pixel di ogni blocco);
    int y0 = 10 + (riga * 15 // Dimensione in pixel di ogni blocco);
    int i, j;
    for (i = 0; i < 15 // Dimensione in pixel di ogni blocco; i++) {
        for (j = 0; j < 15 // Dimensione in pixel di ogni blocco; j++) {
            if (i == 15 // Dimensione in pixel di ogni blocco - 1 || j == 15 // Dimensione in pixel di ogni blocco - 1)
                LCD_SetPoint(x0 + j, y0 + i, 0x0000 // Sfondo);
            else
                LCD_SetPoint(x0 + j, y0 + i, colore);
        }
    }
}

void disegna_tetramino(Tetramino blocco, uint16_t colore) {
    int i;
    for(i = 0; i < 4; i++) {
        int r = blocco.posizione.riga + blocco.celle[i].riga;
        int c = blocco.posizione.colonna + blocco.celle[i].colonna;
        if(r >= 0 && r < 20 // Righe della griglia di gioco && c >= 0 && c < 10 // Colonne) {
            disegna_cella_griglia(r, c, colore);
        }
    }
}

void disegna_griglia_statica(void) {
    int i;
    char str[15];
    int x_start = 5 - 1;
    int y_start = 10 - 1;
    int width_px = 10 // Colonne * 15 // Dimensione in pixel di ogni blocco + 2;
    int height_px = 20 // Righe della griglia di gioco * 15 // Dimensione in pixel di ogni blocco + 2;

    for(i = 0; i < width_px; i++) {
        LCD_SetPoint(x_start + i, y_start, 0xF81F // 0xF81F (T piece) - R=31, G=0, B=31);
        LCD_SetPoint(x_start + i, y_start + height_px, 0xF81F // 0xF81F (T piece) - R=31, G=0, B=31);
    }
    for(i = 0; i < height_px; i++) {
        LCD_SetPoint(x_start, y_start + i, 0xF81F // 0xF81F (T piece) - R=31, G=0, B=31);
        LCD_SetPoint(x_start + width_px, y_start + i, 0xF81F // 0xF81F (T piece) - R=31, G=0, B=31);
    }

    GUI_Text(160, 20, (uint8_t *) "SCORE", 0xF81F // 0xF81F (T piece) - R=31, G=0, B=31, 0x0000 // Sfondo);
    sprintf(str, "%d", punteggio);
    GUI_Text(160, 40, (uint8_t *)str, 0xF81F // 0xF81F (T piece) - R=31, G=0, B=31, 0x0000 // Sfondo);

    GUI_Text(160, 70, (uint8_t *) "LINES", 0xF81F // 0xF81F (T piece) - R=31, G=0, B=31, 0x0000 // Sfondo);
    sprintf(str, "%d", linee_completate_totali);
    GUI_Text(160, 90, (uint8_t *)str, 0xF81F // 0xF81F (T piece) - R=31, G=0, B=31, 0x0000 // Sfondo);

    GUI_Text(160, 120, (uint8_t *) "HI-SCORE", 0xF81F // 0xF81F (T piece) - R=31, G=0, B=31, 0x0000 // Sfondo);
    sprintf(str, "%d", record_punteggio);
    GUI_Text(160, 140, (uint8_t *)str, 0xFFE0 // Giallo (O piece) - R=31, G=63, B=0, 0x0000 // Sfondo);

    GUI_Text(160, 170, (uint8_t *) "NEXT", 0xF81F // 0xF81F (T piece) - R=31, G=0, B=31, 0x0000 // Sfondo);

    if (stato_gioco == GIOCO_IN_PAUSA) {
        GUI_Text(160, 265, (uint8_t *) "PAUSED", 0xFFE0 // Giallo (O piece) - R=31, G=63, B=0, 0x0000 // Sfondo);
    }
}

void disegna_blocco_anteprima(Tetramino blk, uint16_t colore) {
    int start_x = 160;
    int start_y = 190;
    int i, a, b;
    for(i = 0; i < 4; i++) {
        int r = blk.celle[i].riga + 1;
        int c = blk.celle[i].colonna + 1;
        int px = start_x + (c * 15 // Dimensione in pixel di ogni blocco);
        int py = start_y + (r * 15 // Dimensione in pixel di ogni blocco);
        for (a = 0; a < 15 // Dimensione in pixel di ogni blocco; a++) {
            for (b = 0; b < 15 // Dimensione in pixel di ogni blocco; b++) {
                if (a == 15 // Dimensione in pixel di ogni blocco - 1 || b == 15 // Dimensione in pixel di ogni blocco - 1)
                    LCD_SetPoint(px + b, py + a, 0x0000 // Sfondo);
                else
                    LCD_SetPoint(px + b, py + a, colore);
            }
        }
    }
}

// --- Logica di Gioco ---

int controlla_collisione(Tetramino b) {
    int i;
    for(i = 0; i < 4; i++) {
        int r = b.posizione.riga + b.celle[i].riga;
        int c = b.posizione.colonna + b.celle[i].colonna;

        if (r >= 20 // Righe della griglia di gioco) return 1;
        if (c < 0 || c >= 10 // Colonne) return 1;
        if (r >= 0 && griglia[r][c] != 0x0000 // Sfondo) return 1;
    }
    return 0;
}

void controlla_linee(void) {
    int row, col, k;
    int linee_cancellate = 0;
    char str[15];

    for(row = 20 // Righe della griglia di gioco - 1; row >= 0; row--) {
        int full = 1;
        for(col = 0; col < 10 // Colonne; col++) {
            if(griglia[row][col] == 0x0000 // Sfondo) {
                full = 0; break;
            }
        }

        if(full) {
            linee_cancellate++;
            for(k = row; k > 0; k--) {
                for(col = 0; col < 10 // Colonne; col++) {
                    griglia[k][col] = griglia[k-1][col];
                }
            }
            for(col = 0; col < 10 // Colonne; col++) {
                griglia[0][col] = 0x0000 // Sfondo;
            }
            row++;
        }
    }

    if(linee_cancellate > 0) {
        linee_completate_totali += linee_cancellate;
        sprintf(str, "%d", linee_completate_totali);
        GUI_Text(160, 90, (uint8_t *)str, 0xFFFF // Testo/Bordi, 0x0000 // Sfondo);

        if (linee_cancellate == 4) punteggio += 600;
        else punteggio += (linee_cancellate * 100);

        sprintf(str, "%d", punteggio);
        GUI_Text(160, 40, (uint8_t *)str, 0xFFFF // Testo/Bordi, 0x0000 // Sfondo);

        for(row=0; row<20 // Righe della griglia di gioco; row++) {
             for(col=0; col<10 // Colonne; col++) {
                 disegna_cella_griglia(row, col, griglia[row][col]);
             }
        }
    }
}

void genera_blocco(void) {
    int i;
    if (tetraminoCorrente.tipo == 0 && tetraminoSuccessivo.tipo == 0) {
        tetraminoSuccessivo.tipo = (TipoBlocco)(rand() % 7);
        tetraminoSuccessivo.colore = COLORI_TETRAMINI[tetraminoSuccessivo.tipo];
        tetraminoSuccessivo.rotazione = 0;
        for(i=0; i<4; i++) tetraminoSuccessivo.celle[i] = FORME_TETRAMINI[tetraminoSuccessivo.tipo][i];
    }
    tetraminoCorrente = tetraminoSuccessivo;
    tetraminoCorrente.posizione.riga = 1;
    tetraminoCorrente.posizione.colonna = 10 // Colonne / 2;
    disegna_blocco_anteprima(tetraminoCorrente, 0x0000 // Sfondo);

    tetraminoSuccessivo.tipo = (TipoBlocco)(rand() % 7);
    tetraminoSuccessivo.colore = COLORI_TETRAMINI[tetraminoSuccessivo.tipo];
    tetraminoSuccessivo.rotazione = 0;
    for(i=0; i<4; i++) tetraminoSuccessivo.celle[i] = FORME_TETRAMINI[tetraminoSuccessivo.tipo][i];
    disegna_blocco_anteprima(tetraminoSuccessivo, tetraminoSuccessivo.colore);
}

void alla_pressione_tasto1(void) {
    srand(((LPC_TIM_TypeDef *) ((0x40000000UL) + 0x04000) )->TC); // Seed random usando il timer
    if (stato_gioco == GIOCO_FINITO) {
        richiesta_riavvio = 1;
        return;
    }
    if (stato_gioco == GIOCO_IN_PAUSA) {
        stato_gioco = GIOCO_IN_CORSO;
        GUI_Text(160, 265, (uint8_t *) "      ", 0x0000 // Sfondo, 0x0000 // Sfondo);
    }
    else if (stato_gioco == GIOCO_IN_CORSO) {
        stato_gioco = GIOCO_IN_PAUSA;
        GUI_Text(160, 265, (uint8_t *) "PAUSED", 0xFFE0 // Giallo (O piece) - R=31, G=63, B=0, 0x0000 // Sfondo);
    }
}

// ... (codice precedente invariato) ...

void inizializza_gioco(void) {
    int i, j;

    // Configura le priorità: Musica (T0/T1) alta, Gioco (T2) bassa
    __NVIC_SetPriority(TIMER0_IRQn, 0); // Musica Freq (Alta priorità)
    __NVIC_SetPriority(TIMER1_IRQn, 1); // Musica Durata
    __NVIC_SetPriority(RIT_IRQn, 2); // Joystick
    __NVIC_SetPriority(TIMER2_IRQn, 3); // Gioco (Bassa priorità)

    for(i = 0; i < 20 // Righe della griglia di gioco; i++) {
        for(j = 0; j < 10 // Colonne; j++) {
            griglia[i][j] = 0x0000 // Sfondo;
        }
    }

    punteggio = 0;
    linee_completate_totali = 0;
    stato_gioco = GIOCO_IN_PAUSA;

    tetraminoCorrente.tipo = 0;
    tetraminoSuccessivo.tipo = 0;

    LCD_Clear(0x0000 // Sfondo);
    disegna_griglia_statica();
    genera_blocco();

    // --- PARTE MANCANTE FONDAMENTALE ---

    // 1. Accendi elettricamente il Timer 2 (altrimenti non parte!)
    // Nota: power_on_timer2() è in lib_timer.c, se non la vede usa la riga sotto:
    ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PCONP |= (1 << 22);

    // 2. Inizializza Timer 2: TimerNum=2, Prescaler=0, Match=0, Config=3, Valore=0x65B9A
    // 0x65B9A corrisponde a circa 60Hz (velocità di gioco fluida)
    init_timer(2, 0, 0, 3, 0x65B9A);

    // 3. Avvia il Timer 2
    enable_timer(2);

    // Se vuoi la musica, scommenta questa riga (DOPO aver fixato music.c)
    // playNote(tetris_theme[0]);
}

// ... (resto del file invariato) ...
void blocca_blocco(void) {
    int i;
    char str[15];
    for(i = 0; i < 4; i++) {
        int r = tetraminoCorrente.posizione.riga + tetraminoCorrente.celle[i].riga;
        int c = tetraminoCorrente.posizione.colonna + tetraminoCorrente.celle[i].colonna;
        if(r >= 0 && r < 20 // Righe della griglia di gioco && c >= 0 && c < 10 // Colonne) {
            griglia[r][c] = tetraminoCorrente.colore;
        }
    }
    punteggio += 10;
    sprintf(str, "%d", punteggio);
    GUI_Text(160, 40, (uint8_t *)str, 0xFFFF // Testo/Bordi, 0x0000 // Sfondo);
    mod_caduta_rapida = 0;
    controlla_linee();
    genera_blocco();
    disegna_tetramino(tetraminoCorrente, tetraminoCorrente.colore);

    if (controlla_collisione(tetraminoCorrente)) {
        stato_gioco = GIOCO_FINITO;
        GUI_Text(50, 150, (uint8_t *)"GAME OVER", 0xF800 // Rosso (Z piece) - R=31, G=0, B=0, 0xFFFF // Testo/Bordi);
        if (punteggio > record_punteggio) {
            record_punteggio = punteggio;
            sprintf(str, "%d", record_punteggio);
            GUI_Text(160, 140, (uint8_t *)str, 0xFFE0 // Giallo (O piece) - R=31, G=63, B=0, 0x0000 // Sfondo);
            GUI_Text(50, 170, (uint8_t *)"NEW RECORD!", 0xFFE0 // Giallo (O piece) - R=31, G=63, B=0, 0x0000 // Sfondo);
        }
        GUI_Text(30, 190, (uint8_t *)"PRESS KEY1", 0xFFFF // Testo/Bordi, 0x0000 // Sfondo);
    }
}

void ruota_blocco(void) {
    Tetramino temp = tetraminoCorrente;
    int i;
    if (temp.tipo == BLOCCO_O) return;
    for(i = 0; i < 4; i++) {
        int oldRow = temp.celle[i].riga;
        int oldCol = temp.celle[i].colonna;
        temp.celle[i].riga = oldCol;
        temp.celle[i].colonna = -oldRow;
    }
    temp.rotazione = (temp.rotazione + 1) % 4;
    if (controlla_collisione(temp) == 0) {
        disegna_tetramino(tetraminoCorrente, 0x0000 // Sfondo);
        tetraminoCorrente = temp;
        disegna_tetramino(tetraminoCorrente, tetraminoCorrente.colore);
    }
}

static int ticks = 0;

void aggiorna_gioco(void) {
    Tetramino temp;

    if (richiesta_riavvio) {
        richiesta_riavvio = 0;
        inizializza_gioco();
        return;
    }
    if (stato_gioco != GIOCO_IN_CORSO) return;

    if (mod_caduta_rapida == 1) {
        disegna_tetramino(tetraminoCorrente, 0x0000 // Sfondo);
        while (controlla_collisione(tetraminoCorrente) == 0) {
            tetraminoCorrente.posizione.riga++;
        }
        tetraminoCorrente.posizione.riga--;
        disegna_tetramino(tetraminoCorrente, tetraminoCorrente.colore);
        blocca_blocco();
        return;
    }

    if (J_up != 0) { ruota_blocco(); J_up = 0; }
    if (J_left != 0) {
        temp = tetraminoCorrente;
        temp.posizione.colonna--;
        if (controlla_collisione(temp) == 0) {
            disegna_tetramino(tetraminoCorrente, 0x0000 // Sfondo);
            tetraminoCorrente = temp;
            disegna_tetramino(tetraminoCorrente, tetraminoCorrente.colore);
        }
        J_left = 0;
    }
    if (J_right != 0) {
        temp = tetraminoCorrente;
        temp.posizione.colonna++;
        if (controlla_collisione(temp) == 0) {
            disegna_tetramino(tetraminoCorrente, 0x0000 // Sfondo);
            tetraminoCorrente = temp;
            disegna_tetramino(tetraminoCorrente, tetraminoCorrente.colore);
        }
        J_right = 0;
    }

    ticks++;
    // Qui si potrebbe usare il potenziometro per la velocità
    int threshold = 40;
    if (J_down != 0) threshold = 2;

    if (ticks >= threshold) {
        ticks = 0;
        temp = tetraminoCorrente;
        temp.posizione.riga++;
        if (controlla_collisione(temp)) {
            blocca_blocco();
        } else {
            disegna_tetramino(tetraminoCorrente, 0x0000 // Sfondo);
            tetraminoCorrente.posizione.riga++;
            disegna_tetramino(tetraminoCorrente, tetraminoCorrente.colore);
        }
    }
}
