/*
 * Test program for Dragon PCI/PCI-E driver
 *
 *   Copyright (C) 2011-2014 Pierre Ficheux (pierre.ficheux@gmail.com)
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
#include <malloc.h>

int main (int ac, char **av)
{
  int fd, i, nw, nr, ndata, inc = 0x11111111, quiet = 0;
  unsigned int addr = 0, data = 0x11111111, *buf;

  if (ac <= 3) {
    fprintf (stderr, "Usage: %s dragon_device_name addr count [data inc] [q]\n", av[0]);
    exit (1);
  }

  if ((fd = open (av[1], O_RDWR)) < 0) {
    perror (av[1]);
    exit (1);
  }

  // Address (32 bits)
  sscanf (av[2], "%x", &addr);
  addr *= 4;

  // # of data (32 bits)
  ndata = atoi(av[3]);
  
  // Initial value to write
  if (ac >= 5) {
    if (av[4][0] == '\'')
      data = av[4][1];
    else
      sscanf (av[4], "%x", &data);
  }

  // Increment
  if (ac >= 6)
    sscanf (av[5], "%x", &inc);

  // Quiet mode
  if (ac >= 7 && av[6][0] == 'q')
    quiet = 1;

  if (!quiet)
    printf ("Write+read %d long-word(s) starting @ 0x%08X, value is 0x%08X, increment is 0x%08X\n\n", ndata, addr, data, inc);

  // Build datas
  if ((buf = (unsigned int *) malloc (ndata * sizeof(unsigned int))) == NULL) {
    perror ("malloc");
    exit (1);
  }

  for (i = 0 ; i < ndata ; i++) {
    *(buf+i) = data;
    if (!quiet)
      printf ("buf[%d] = 0x%08X\n", i, *(buf+i));
    data += inc;
  }

  // Write datas
  lseek (fd, addr, SEEK_SET);
  nw = write (fd, (char *)buf, ndata * sizeof(unsigned int));

  if (!quiet)
    printf ("Wrote %d chars @%08X\n\n", nw, addr);

  // Read datas
  lseek (fd, addr, SEEK_SET);
  nr = read (fd, (char *)buf, nw);
  
  if (!quiet)
    printf ("Read %d chars @%08X\n", nr, addr);

  if (!quiet)
    for (i = 0 ; i < nr / sizeof (unsigned int) ; i++)
      printf ("buf[%d] = 0x%08X\n", i, *(buf+i));

  free (buf);

  close (fd);

  return 0;
}
