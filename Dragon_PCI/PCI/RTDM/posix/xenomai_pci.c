/* 
 * Xenomai version of SQUARE example, POSIX skin + RTDM driver
 */

#include <sys/mman.h>
#include <sys/time.h>
#include <sys/io.h>
#include <unistd.h>
#include <stdlib.h>
#include <math.h>
#include <stdio.h>
#include <string.h>
#include <signal.h>
#include <getopt.h>
#include <time.h>
#include <pthread.h>
#include <rtdm/rtdm.h>
#include <native/task.h>
#include <rtdk.h>

pthread_t thid_square;
int use_rtdk;

#define PERIOD          50000000LL /* 50 ms = 50 x 1000000 ns */
int led_mask=0x01;
int fd;

long period_ns = 0;
int loop_prt = 100;             /* print every 100 loops: 5 s */ 
int test_loops = 0;             /* outer loop count */

/* Thread function*/
void *thread_square (void *dummy)
{
    int err;
    struct timespec start, period, t, told;

    // Display every 2 sec
    loop_prt = 2000000000 / period_ns;

    /* Start a periodic task in 1s */
    clock_gettime(CLOCK_REALTIME, &start);
    start.tv_sec += 1;
    period.tv_sec = 0;
    period.tv_nsec = period_ns;

    // Warn switch
    rt_task_set_mode(0, T_WARNSW, NULL);

    // Make task periodic
    err = pthread_make_periodic_np(pthread_self(), &start, &period);

    if (err)
        {
        fprintf(stderr,"square: failed to set periodic, code %d\n",err);
	exit(EXIT_FAILURE);
        }

    /* Main loop */
    for (;;)
        {
	  unsigned long overruns = 0;
	  
	  test_loops++;

	  /* Wait scheduler */
	  err = pthread_wait_np(&overruns);

	  if (err || overruns) {
	    fprintf(stderr,"wait_period failed: err %d, overruns: %lu\n", err, overruns);
	    exit(EXIT_FAILURE);
	  }

	  /* Write value with RTDM ioctl or write */
	  //    if (rt_dev_ioctl(fd, PCI_IO_IOCTL_WRITE, led_val) < 0)
	  //      errx(EXIT_FAILURE, "ioctl error");

	  /* Write to // port */
	  rt_dev_write(fd, (void *)&led_mask, 1);
	  led_mask = ~led_mask;

	  /* Read value */
	  //		rt_dev_ioctl(fd, PCI_IO_IOCTL_READ, &val);

	  /* old_time <-- current_time */
	  told.tv_sec = t.tv_sec;
	  told.tv_nsec = t.tv_nsec;

	  /* Get current time */
	  clock_gettime (CLOCK_REALTIME, &t);

	  /* Print if necessary */
	  if ((test_loops % loop_prt) == 0) {
	    if (use_rtdk)
	      rt_printf ("Loop= %d dt= %ld %ld (%ld ns)\n", test_loops, t.tv_sec - told.tv_sec, t.tv_nsec - told.tv_nsec, t.tv_nsec - told.tv_nsec - period_ns);
	    else
	      printf ("Loop= %d dt= %ld %ld (%ld ns)\n", test_loops, t.tv_sec - told.tv_sec, t.tv_nsec - told.tv_nsec, t.tv_nsec - told.tv_nsec - period_ns);
	  }
	}
}

void cleanup_upon_sig(int sig __attribute__((unused)))
{
  pthread_cancel (thid_square);
  pthread_join (thid_square, NULL);
  rt_dev_close (fd);

  exit(0);
}

void warn_upon_switch(int sig __attribute__((unused)))
{
  printf ("DOMAIN SWITCH !!\n");
}

void usage (char *s)
{
  fprintf (stderr, "Usage: %s [-p period] [-k]\n", s);
  exit (1);
}

int main (int ac, char **av)
{
    int err;
    struct sched_param param_square = {.sched_priority = 99 };
    pthread_attr_t thattr_square;
    char *cp, *progname = (char*)basename(av[0]);

    period_ns = PERIOD; /* ns */

    while (--ac) {
      if ((cp = *++av) == NULL)
	break;
      if (*cp == '-' && *++cp) {
	switch(*cp) {
	case 'k' :
	  use_rtdk = 1;
	  rt_print_auto_init(1);
	  printf ("Using RTDK\n");
	  break;

	case 'p' :
	  period_ns = (unsigned long)atoi(*++av); break;

	default: 
	  usage(progname);
	  break;
	}
      }
      else
	break;
    }

    signal(SIGINT, cleanup_upon_sig);
    signal(SIGTERM, cleanup_upon_sig);
    signal(SIGHUP, cleanup_upon_sig);
    signal(SIGALRM, cleanup_upon_sig);
    signal(SIGXCPU, warn_upon_switch);

    printf("== Period: %ld us\n", period_ns / 1000);

    // Avoid paging: MANDATORY for RT !!
    mlockall(MCL_CURRENT|MCL_FUTURE);

    // Open RTDM driver
    if ((fd = rt_dev_open("pci_io0", 0)) < 0) {
      perror("rt_open");
      exit(EXIT_FAILURE);
    }

    // Thread attributes
    pthread_attr_init(&thattr_square);

    // Joinable 
    pthread_attr_setdetachstate(&thattr_square, PTHREAD_CREATE_JOINABLE);

    // Priority, set priority to 99
    pthread_attr_setinheritsched(&thattr_square, PTHREAD_EXPLICIT_SCHED);
    pthread_attr_setschedpolicy(&thattr_square, SCHED_FIFO);
    pthread_attr_setschedparam(&thattr_square, &param_square);

    // Create thread 
    err = pthread_create(&thid_square, &thattr_square, &thread_square, NULL);

    if (err)
        {
	  fprintf(stderr,"square: failed to create square thread, code %d\n",err);
	  return 0;
        }

    pause();

    return 0;
}
