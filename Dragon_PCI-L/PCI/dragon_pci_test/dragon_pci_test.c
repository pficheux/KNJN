/*
 * Test program for Dragon PCI/PCI-E driver
 *
 *   Copyright (C) 2011-2017 Pierre Ficheux (pierre.ficheux@gmail.com)
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
  int fd, i, nw, ndata, inc = 0, quiet = 0;
  unsigned int data = 0, *buf;

  if (ac <= 2) {
    fprintf (stderr, "Usage: %s dragon_device_name count data inc [q]\n", av[0]);
    exit (1);
  }

  if ((fd = open (av[1], O_RDWR)) < 0) {
    perror (av[1]);
    exit (1);
  }

  // # of data (32 bits)
  ndata = atoi(av[2]);
  
  // Initial value to write
  if (ac >= 4) {
    if (av[3][0] == '\'')
      data = av[3][1];
    else
      sscanf (av[3], "%x", &data);
  }

  // Increment
  if (ac >= 5)
    sscanf (av[4], "%x", &inc);

  // Quiet mode
  if (ac >= 6 && av[5][0] == 'q')
    quiet = 1;

  if (!quiet)
    printf ("Write %d long-word(s), value is 0x%08X, increment is 0x%08X\n\n", ndata, data, inc);

  // Build datas
  if ((buf = (unsigned int *) calloc (ndata, sizeof(unsigned int))) == NULL) {
    perror ("calloc");
    exit (1);
  }

  for (i = 0 ; i < ndata ; i++) {
    *(buf+i) = data;
    if (!quiet)
      printf ("buf[%d] = 0x%08X\n", i, *(buf+i));
    data += inc;
  }

  // Write datas
  if ((nw = write (fd, (char *)buf, ndata * sizeof(unsigned int))) < 0)
    perror ("write");
  else if (!quiet)
    printf ("Wrote %d chars\n\n", nw);

  free (buf);

  close (fd);

  return 0;
}
