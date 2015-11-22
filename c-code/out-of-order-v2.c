/**
* Demonstrate CPU reordering
* or "out of order" effect as asked here:
* http://stackoverflow.com/questions/33849209/test-program-for-cpu-out-of-order-effect
* This code is from https://hathcock.me/2015/11/22/cpu_ooo.cc.html
* Define CPU_FENCE as 0 to see the CPU load-after-store reordering effect
*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <sched.h>

#include <thread>

#define CPU_FENCE   0

constexpr auto NUM_CPUS=4ul;
constexpr auto MAX_ATTEMPTS = 1000*100ul;

//
//  utilities
//

inline void pin_RT(int cpu) {
  auto set = CPU_ALLOC(NUM_CPUS);
  auto size = CPU_ALLOC_SIZE(NUM_CPUS);
  CPU_ZERO_S(size, set);
  CPU_SET_S(cpu, size, set);
  if (sched_setaffinity(0, size, set) != 0) {
    fprintf(stderr, "unable to pin to cpu %i\n", cpu);
    exit(EXIT_FAILURE);
  }
  CPU_FREE(set);

  struct sched_param p;
  p.sched_priority = 99;
  if (sched_setscheduler(0, SCHED_FIFO, &p) != 0) {
    fprintf(stderr, "unable to set SCHED_FIFO: %s\n",
      strerror(errno));
    exit(EXIT_FAILURE);
  }
}

inline void __pause() {
  __asm__ __volatile__ ("pause":::);
}

inline void __compiler_fence() {
  __asm__ __volatile__ ("":::);
}

inline void __cpu_fence() {
  //
  //  heavyweight fence
  //
  __asm__ __volatile__ ("mfence":::);
}

//
//  this is essentially just an implementation of volume 3A (page 8-9)
//  section 8.2.3.4
//
//  "loads may be reordered with earlier stores"
//

volatile uint64_t p0_starts = 0;
volatile uint64_t p0_ends = 0;
volatile uint64_t p1_starts = 0;
volatile uint64_t p1_ends = 0;

volatile uint64_t x = 0;
volatile uint64_t y = 0;
volatile uint64_t r1 = 0;
volatile uint64_t r2 = 0;

void processor_0() {

  pin_RT(1);

  auto attempts = 0ul;
  ++p0_starts;
  while (attempts++ < MAX_ATTEMPTS) {

    while (p1_starts < p0_starts)
      __pause();

    x = 1;
#if CPU_FENCE
    __cpu_fence();
#endif
    r1 = y;

    ++p0_ends;
    while (p1_ends < p0_ends)
      __pause();

    ++p0_starts;

  }

}

void processor_1() {

  pin_RT(3);

  auto reorders = 0ul;
  auto attempts = 0ul;

  ++p1_starts;
  while (attempts++ < MAX_ATTEMPTS) {

    while (p0_starts < p1_starts)
      __pause();

    y = 1;
#if CPU_FENCE
    __cpu_fence();
#endif
    r2 = x;

    ++p1_ends;
    while (p0_ends < p1_ends)
      __pause();
  
    if (r1 == 0 and r2 == 0)
      ++reorders;

    x = 0;
    y = 0;
    r1 = 0;
    r2 = 0;

    ++p1_starts;

  }

  printf("after %lu attempts, %lu reorders observed\n",
    MAX_ATTEMPTS, reorders);

}

int main(int argc, char* argv[]) {

  auto t0 = std::thread(processor_0);
  auto t1 = std::thread(processor_1);

  t0.join();
  t1.join();

  return 0;
}
