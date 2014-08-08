/*
 * Real-time test program for Dragon PCI-E driver
 *
 * Xhange GPIO state every X nsec (default is 50 ms).
 *
 * # pci_test_test [period_ns]
 *
 *   Copyright (C) 2014 Pierre Ficheux (pierre.ficheux@gmail.com)
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program; if not, write to the Free Software
 *   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <time.h>
#include <signal.h>

static int fd;
static char buf[8];
int nibl;
timer_t my_timer;
struct itimerspec new, old;
unsigned long period = 50000000; // default is 50 ms

void got_sigint (int sig) 
{
  printf ("Got SIGINT\n");

  if (timer_delete (my_timer) < 0) {
    perror ("timer_delete");
    exit (1);
  }

  close (fd);

  exit (0);
}

void got_sigalrm (int sig)
{
  // goto addr 0
  lseek (fd, 0, SEEK_SET);

  // build data then write
  buf[0] = buf[4] = nibl;
  write (fd, buf, sizeof(buf));

  // change GPIO state
  nibl = (nibl == 0 ? 1 : 0);
}

int main (int ac, char **av)
{
  if (ac >= 2)
    period = atoi(av[1]);

  printf ("Period= %ld ns\n", period);

  if ((fd = open ("/dev/dragon_pci_mem0", O_RDWR)) < 0) {
    perror ("open");
    exit (1);
  }

  signal (SIGALRM, got_sigalrm);
  signal (SIGINT, got_sigint);

  memset (buf, 0, sizeof(buf));

  if (timer_create (CLOCK_REALTIME, NULL, &my_timer) < 0) {
    perror ("timer_create");
    exit (1);
  }

  new.it_value.tv_sec = 0;
  new.it_value.tv_nsec = 1000000;
  new.it_interval.tv_sec = 0;
  new.it_interval.tv_nsec = period;

  if (timer_settime (my_timer, 0, &new, &old) < 0) {
    perror ("timer_settime");
    exit (1);
  }

  while (1)
    pause ();

  return 0;
}
