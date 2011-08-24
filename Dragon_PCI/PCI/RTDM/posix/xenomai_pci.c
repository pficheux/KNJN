/*
 * Xenomai version of SQUARE example, POSIX skin + RTDM driver
 */

#include <err.h>
#include <math.h>
#include <pthread.h>
#include <rtdm/rtdm.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/io.h>
#include <sys/mman.h>
#include <sys/time.h>
#include <time.h>
#include <unistd.h>

#include <pci_io_rtdm.h>

#define __unused __attribute__((__unused__))

pthread_t th_led_id;
int fd;
unsigned long long int period_ns;

int test_loops = 0;             /* outer loop count */

void *th_led_callback(void *args __unused)
{
  int error;
  struct timespec start, period, t, told;
  int led_val = 0, loop_prt;

  // Display every 2 sec
  loop_prt = 2000000000 / period_ns;

  /* Start a  periodic task in 1s */
  clock_gettime(CLOCK_REALTIME, &start);
  start.tv_sec += 1;
  period.tv_sec = 0;
  period.tv_nsec = period_ns;

  // Make task periodic
  if ((error = pthread_make_periodic_np(pthread_self(), &start, &period)) != 0)
    errx(EXIT_FAILURE, "failed to set periodic (code = %d)", error);

  /* Main loop */
  for (;;) {
    unsigned long overruns = 0;

    test_loops++;

    /* Wait scheduler */
    error = pthread_wait_np(&overruns);

    if (error || overruns)
      errx(EXIT_FAILURE, "wait_period failed"
	   " (err = %d) (overruns = %lu)", error, overruns);

    /* Write value with RTDM ioctl or write */
//    if (rt_dev_ioctl(fd, PCI_IO_IOCTL_WRITE, led_val) < 0)
//      errx(EXIT_FAILURE, "ioctl error");
        if (rt_dev_write(fd, &led_val, sizeof(int)) < 0) 
          errx(EXIT_FAILURE, "write error");
      
    led_val = ~led_val;

    /* Read value */
    //		rt_dev_ioctl(fd, PCI_IO_IOCTL_READ, &val);

    /* old_time <-- current_time */
    told.tv_sec = t.tv_sec;
    told.tv_nsec = t.tv_nsec;

    /* Get current time */
    clock_gettime(CLOCK_REALTIME, &t);

    /* Print if necessary */
    if ((test_loops % loop_prt) == 0)
      printf("Loop= %d sec= %ld nsec=%ld jitter= %lld ns\n", test_loops, t.tv_sec - told.tv_sec, t.tv_nsec - told.tv_nsec, t.tv_nsec - told.tv_nsec - period_ns);
  }
}

void cleanup_upon_sig(int sig __unused)
{
  pthread_cancel(th_led_id);
  pthread_join(th_led_id, NULL);
  rt_dev_close(fd);

  exit(EXIT_SUCCESS);
}

void usage()
{
  extern char * __progname;

  fprintf(stderr, "usage: %s dev period ", __progname);
}

int main (int argc, char **argv)
{
  int error;
  char *device;
  struct sched_param th_led_param = { .sched_priority = 99 };
  pthread_attr_t th_led_attr;

  if (argc < 3) {
    usage();
    return EXIT_FAILURE;
  }

  device = argv[1];
  period_ns = atoi(argv[2]); /* ns */

  if (period_ns == 0)
    errx(EXIT_FAILURE, "invalid period");

  signal(SIGINT, cleanup_upon_sig);
  signal(SIGTERM, cleanup_upon_sig);
  signal(SIGHUP, cleanup_upon_sig);

  printf("Period: %lld us\n", period_ns / 1000);

  // Avoid paging: MANDATORY for TR !!
  mlockall(MCL_CURRENT | MCL_FUTURE);

  // Open RTDM driver
  if ((fd = rt_dev_open(device, 0)) < 0)
    err(EXIT_FAILURE, "rt_open");

  // Thread attributes
  pthread_attr_init(&th_led_attr);

  // Joinable
  pthread_attr_setdetachstate(&th_led_attr, PTHREAD_CREATE_JOINABLE);

  // Priority, set priority to 99
  pthread_attr_setinheritsched(&th_led_attr, PTHREAD_EXPLICIT_SCHED);
  pthread_attr_setschedpolicy(&th_led_attr, SCHED_FIFO);
  pthread_attr_setschedparam(&th_led_attr, &th_led_param);

  // Create thread
  if ((error = pthread_create(&th_led_id, &th_led_attr, &th_led_callback, NULL)) != 0)
    errx(EXIT_FAILURE, "failed to create thread (code = %d)", error);

  pause();

  return EXIT_SUCCESS;
}
