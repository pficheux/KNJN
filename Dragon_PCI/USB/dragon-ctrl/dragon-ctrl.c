// Implemented:
// -----------
//   an2131 init
//   an2131 memwrite
//     an2131 cpucs
//     an2131 reboot
//   dragon i2c read
//     dragon eeprom dump
//   dragon i2c write
//     dragon i2c probe
//     dragon eeprom write
//   dragon data read
//   dragon data write
//   dragon fpga programming

// Extras:
// ------
//   .hex file compiler
//   an2131 eeprom file compiler
//   an2131 eeprom file decompiler

// Missing:
// -------
//   dragon boot prom erasing, writing and reading
//   a better main with better comments :)

/* 
   This code requires libusb to work. That library exists for linux, macosx
   and windows. The windows support is called "libusb-win32", and can be found
   on http://libusb-win32.sf.net - Please note that it'll require installing a
   specific driver for the an2131. Also, please note that windows recognize
   the devices *per plug*. That way, you can assign a libusb-win32 driver for
   the dragon on one plug, and a dragon-fpga driver on another plug, and
   swapping drivers simply by changing the plug.

   Also, to compile it under windows, you'll need (of course) the libusb-win32
   libraries and includes, but also the getopt package; which sources are
   provided into this directory. Linking with the getopt.c and getopt1.c files
   under linux or macosx isn't necessary at all.

   This software uses the bitfile code from bininfo. Check bitfile.c header for
   details.
*/

/*
   Disclaimer: that code is mainly done by reverse engineering the dragon
   software that comes with the dragon fpga board. These softwares are only
   available when buying a dragon fpga board at http://www.fpga4fun.com
*/

/*
 * Code written by Nicolas "Pixel" Noble
 * http://www.nobis-crew.org
 * pixel@nobis-crew.org
 *
 * This is free software; you can redistribute it and/or modify it under the
 * terms of the GNU General Public License as published by the Free Software
 * Foundation, version 2 of the License.
 *
 * This software is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this software; if not, write to the Free Software Foundation, Inc., 59 Temple
 * Place, Suite 330, Boston, MA 02111-1307 USA
 */


#include <stdio.h>
#include <string.h>
#include <usb.h>

#include "control_request.h"
#include "bitfile.h"
#include "getopt.h"

typedef unsigned char u8;
typedef unsigned short int u16;
typedef unsigned long int u32;


#define DEBUG

int VID = 0x547;
int PID = 0x2131;

#define TIMEOUT 1000

#define MEMORY_SIZE 8192
#define EEPROM_PAYLOAD 16
#define FIRMWARE_SIZE (8192-EEPROM_PAYLOAD)
#define EEPROM_SIZE 8192

#ifdef DEBUG
#define dprintf(x...) printf(x)
#else
#define dprintf(x...)
#endif

usb_dev_handle * an2131_handle = 0;

int init_an2131(void) {
    struct usb_bus * bus;
    struct usb_device * dev;
    int i, j, k, l;
    
    usb_init();
    usb_find_busses();
    usb_find_devices();
    
    for (bus = usb_get_busses(); bus; bus = bus->next) {
	dprintf("Parsing usb bus %s.\n", bus->dirname);
	for (dev = bus->devices; dev; dev = dev->next) {
	    dprintf("  Parsing usb device [%04X:%04X] %s\n", dev->descriptor.idVendor, dev->descriptor.idProduct, dev->filename);
#if 0	    
	    dprintf("    bLength         = %i\n", dev->descriptor.bLength);
	    dprintf("    bDescriptorType = %i\n", dev->descriptor.bDescriptorType);
	    dprintf("    bcdUSB          = 0x%04x\n", dev->descriptor.bcdUSB);
	    dprintf("    bDeviceClass    = 0x%02x\n", dev->descriptor.bDeviceClass);
	    dprintf("    bDeviceSubClass = 0x%02x\n", dev->descriptor.bDeviceSubClass);
	    dprintf("    bDeviceProtocol = 0x%02x\n", dev->descriptor.bDeviceProtocol);
	    dprintf("    bMaxPacketSize0 = %i\n", dev->descriptor.bMaxPacketSize0);
	    dprintf("    bcdDevice       = 0x%04x\n", dev->descriptor.bcdDevice);
	    dprintf("    iManufacturer   = %i\n", dev->descriptor.iManufacturer);
	    dprintf("    iProduct        = %i\n", dev->descriptor.iProduct);
	    dprintf("    iSerialNumber   = %i\n", dev->descriptor.iSerialNumber);
	    dprintf("    bNumConfigurations = %i\n", dev->descriptor.bNumConfigurations);

	    for (i = 0; i < dev->descriptor.bNumConfigurations; i++) {
		dprintf("    Parsing configuration %i\n", i);
		dprintf("      bLength = %i\n", dev->config[i].bLength);
		dprintf("      bDescriptorType = %i\n", dev->config[i].bDescriptorType);
		dprintf("      wTotalLength = %i\n", dev->config[i].wTotalLength);
		dprintf("      bNumInterfaces = %i\n", dev->config[i].bNumInterfaces);
		dprintf("      bConfigurationValue = %i\n", dev->config[i].bConfigurationValue);
		dprintf("      iConfiguration = %i\n", dev->config[i].iConfiguration);
		dprintf("      bmAttributes = %i\n", dev->config[i].bmAttributes);
		dprintf("      MaxPower = %i\n", dev->config[i].MaxPower);
		for (j = 0; j < dev->config[i].bNumInterfaces; j++) {
		    dprintf("      Parsing interface %i\n", j);
		    dprintf("        num_altsetting = %i\n", dev->config[i].interface[j].num_altsetting);
		    for (k = 0; k < dev->config[i].interface[j].num_altsetting; k++) {
			dprintf("        Parsing altsetting = %i\n", k);
			dprintf("          bLength =            %i\n", dev->config[i].interface[j].altsetting[k].bLength);
			dprintf("          bDescriptorType =    %i\n", dev->config[i].interface[j].altsetting[k].bDescriptorType);
			dprintf("          bInterfaceNumber =   %i\n", dev->config[i].interface[j].altsetting[k].bInterfaceNumber);
			dprintf("          bAlternateSetting =  %i\n", dev->config[i].interface[j].altsetting[k].bAlternateSetting);
			dprintf("          bNumEndpoints =      %i\n", dev->config[i].interface[j].altsetting[k].bNumEndpoints);
			dprintf("          bInterfaceClass =    %i\n", dev->config[i].interface[j].altsetting[k].bInterfaceClass);
			dprintf("          bInterfaceSubClass = %i\n", dev->config[i].interface[j].altsetting[k].bInterfaceSubClass);
			dprintf("          bInterfaceProtocol = %i\n", dev->config[i].interface[j].altsetting[k].bInterfaceProtocol);
			dprintf("          iInterface =         %i\n", dev->config[i].interface[j].altsetting[k].iInterface);
			for (l = 0; l < dev->config[i].interface[j].altsetting[k].bNumEndpoints; l++) {
			    dprintf("          Parsing endpoint = %i\n", l);
			    dprintf("            bLength =          %i\n", dev->config[i].interface[j].altsetting[k].endpoint[l].bLength);
			    dprintf("            bDescriptorType =  %i\n", dev->config[i].interface[j].altsetting[k].endpoint[l].bDescriptorType);
			    dprintf("            bEndpointAddress = %i\n", dev->config[i].interface[j].altsetting[k].endpoint[l].bEndpointAddress);
			    dprintf("            bmAttributes =     %i\n", dev->config[i].interface[j].altsetting[k].endpoint[l].bmAttributes);
			    dprintf("            wMaxPacketSize =   %i\n", dev->config[i].interface[j].altsetting[k].endpoint[l].wMaxPacketSize);
			    dprintf("            bInterval =        %i\n", dev->config[i].interface[j].altsetting[k].endpoint[l].bInterval);
			    dprintf("            bRefresh =         %i\n", dev->config[i].interface[j].altsetting[k].endpoint[l].bRefresh);
			    dprintf("            bSynchAddress =    %i\n", dev->config[i].interface[j].altsetting[k].endpoint[l].bSynchAddress);
			}
		    }
		}
	    }
#endif
	    if ((dev->descriptor.idVendor == VID) && (dev->descriptor.idProduct == PID)) {
		if (an2131_handle) {
		    printf("Another an2131 is connected. Please remove one.\n");
		    return -1;
		}
		dprintf("Found an2131. Opening interface.\n");
		if (!(an2131_handle = usb_open(dev))) {
		    perror("an2131");
		    return -1;
		}
		dprintf("Done. Setting configuration.\n");
		if (usb_set_configuration(an2131_handle, dev->config[0].bConfigurationValue) < 0) {
		    perror("an2131");
		    return -1;
		}
		dprintf("Done. Claiming interface.\n");
		if (usb_claim_interface(an2131_handle, 0) < 0) {
		    perror("an2131");
		    return -1;
		}
		dprintf("Done. Setting alternate interface.\n");
		if (usb_set_altinterface(an2131_handle, 1) < 0) {
		    perror("an2131");
		    return -1;
		}
		dprintf("Done.\n");
	    }
	}
    }
    
    return an2131_handle != NULL ? 0 : 1;
}

int load_hex_file(FILE * in, u8 * out, int maxsize) {
    int size = 0;
    int l = 0, a = 0, t = 0, d = 0;
    int i;
    int c;
    enum {
        RC, RL1, RL2, RA1, RA2, RA3, RA4, RT1, RT2, RD1, RD2, RC1, RC2, RE
    } status = RC;
    
    // format of a record:
    // :llaaaattdd[dd...]cc
    //   ll = length
    //   aaaa = address
    //   tt = record type (0: normal, 1: last record)
    //   dd = data bytes
    //   cc = checksum
    
    memset(out, 0, MEMORY_SIZE);
    
#define CASSERT(x) if (c != x) { fprintf(stderr, "Error parsing hex file: %c != %c\n", c, x); return -1; }
#define HEX if ((c >= '0') && (c <= '9')) c -= '0'; else if ((c >= 'A') && (c <= 'F')) c -= ('A' - 10); else if ((c >= 'a') && (c <= 'f')) c -= ('a' - 10); else { fprintf(stderr, "Error parsing hex file!\n"); return -1; }
#define NEXT status++; break;
    
    while ((c = fgetc(in)) != EOF) {
	switch(status) {
	case RC: CASSERT(':');
	            if (t) {
		        fprintf(stderr, "Error parsing hex file: already got endoffile.\n");
		        return -1;
		    }
		    NEXT
	case RL1: HEX; l  = c <<  4;   NEXT
	case RL2: HEX; l |= c <<  0;   NEXT
	case RA1: HEX; a  = c << 12;   NEXT
	case RA2: HEX; a |= c <<  8;   NEXT
	case RA3: HEX; a |= c <<  4;   NEXT
	case RA4: HEX; a |= c <<  0;   NEXT
	case RT1: HEX; t  = c <<  4;   NEXT
	case RT2: HEX; t |= c <<  0;
	            if (t > 1) {
		        fprintf(stderr, "Unsupported hex record %i.\n", t);
		        return -1;
		    }
		    if (!l) {
			status = RC1;
			break;
		    }
		    NEXT
	case RD1: HEX; d  = c <<  4;   NEXT
	case RD2: HEX; d |= c <<  0;
		    if (a >= maxsize) {
			fprintf(stderr, "Hex file too big for memory!\n");
			return -1;
		    }
		    out[a++] = d;
		    if (size < a) size = a;
		    if (!(--l)) { NEXT }
		    status = RD1; break;
	case RC1: HEX; NEXT // let's discard the checksum part
	case RC2: HEX; NEXT // unless somebody wants to code it
	case RE: if (c == '\r') break; CASSERT('\n'); status = RC;
	}
    }
    
    if ((status != RC) || (!t)) {
	fprintf(stderr, "Hex file truncated!\n");
	return -1;
    }
    
    return size;

#undef CASSERT
#undef HEX
#undef NEXT

}

int build_eeprom(const u8 * in, u8 * out, int size, int vid, int pid, int did) {
    if (size > FIRMWARE_SIZE) {
	fprintf(stderr, "Error: firmware is too big (%i > %i)\n", size, FIRMWARE_SIZE);
	return -1;
    }
    out[0] = 0xb2;
    out[1] = (vid >> 8) & 255;
    out[2] = vid & 255;
    out[3] = (pid >> 8) & 255;
    out[4] = pid & 255;
    out[5] = (did >> 8) & 255;
    out[6] = did & 255;
    out[7] = (size >> 8) & 255;
    out[8] = size & 255;
    out[9] = 0;
    out[10] = 0;
    memcpy(out + 11, in, size);
    out[size + 11] = 0x80;
    out[size + 12] = 0x01;
    out[size + 13] = 0x7f;
    out[size + 14] = 0x92;
    out[size + 15] = 0x00;
    
    return 0;
}

int unbuild_eeprom(const u8 * in, u8 * out) {
    int size, offset, p, final_size = 0;
    
    if (in[0] != 0xb2) {
	fprintf(stderr, "Not a correct EEPROM file.\n");
	return -1;
    }
    
    p = 7;
    
    while (1) {
	size  = in[p++] << 8;
	size |= in[p++];
	offset  = in[p++] << 8;
	offset |= in[p++];
	// quick note: did you notice that the "signature" is actually
	// only a write to the CPUCS register to make the final reboot ? :)
	if ((size == 0x8001) && (offset == 0x7f92) && (in[p] == 0))
	    return final_size;
	
	// TODO: should check size & offset before crashing...
	
	memcpy(out + offset, in + p, size);
	p += size;
	
	if (final_size < (offset + size))
	    final_size = offset + size;
    }
}

int an2131_memwrite(int address, const u8 * data, int size) {
    u8 mem[MEMORY_SIZE];
    memcpy(mem, data, size);
    int r;
    
    if ((r = usb_control_msg(an2131_handle, USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
			0xa0, address, 0, mem, size, TIMEOUT)) < 0) {
	if (r == -116) {
	    fprintf(stderr, "an2131 timeouted recieving a control message.\n");
	} else {
	    perror("an2131");
	}
	return -1;
    }
    
    return 0;
}

int an2131_cpucs(int run) {
    u8 data = run ? 0 : 1;
    return an2131_memwrite(0x7f92, &data, 1);
}

int an2131_reboot(const u8 * data, int size) {
    if (an2131_cpucs(0) < 0) return -1;
    if (an2131_memwrite(0, data, size) < 0) return -1;
    if (an2131_cpucs(1) < 0) return -1;
    return 0;
}

int an2131_write(int ep, const u8 * buffer, int size) {
    int r;
    
    if ((r = usb_bulk_write(an2131_handle, ep, buffer, size, TIMEOUT)) != size) {
	if (r == -116) {
	    fprintf(stderr, "an2131 connection timeouted sending %i bytes.\n", size);
	} else if (r < 0) {
	    fprintf(stderr, "got unknown error, code %i:\n", r);
	    perror("an2131");
	} else {
	    fprintf(stderr, "an2131 didn't get all the requested bytes (%i instead of %i).\n", r, size);
	    return r;
	}
        return -1;
    }
    return 0;
}

int an2131_read(int ep, u8 * buffer, int size) {
    int r;
    
    if ((r = usb_bulk_read(an2131_handle, ep, buffer, size, TIMEOUT)) != size) {
	if (r == -116) {
	    fprintf(stderr, "an2131 connection timeouted recieving %i bytes.\n", size);
	} else if (r == -5) {
	    fprintf(stderr, "an2131 error reading: buffer too small.\n");
	} else if (r < 0) {
	    fprintf(stderr, "got unknown error, code %i:\n", r);
	    perror("an2131");
	} else {
	    fprintf(stderr, "an2131 didn't send all the requested bytes (%i instead of %i)\n", r, size);
	    return r;
	}
        return -1;
    }
    return 0;
}

int an2131_write_u8(int ep, u8 b) {
    return an2131_write(ep, &b, 1);
}

int an2131_read_u8(int ep) {
    u8 b;
    
    if (an2131_read(ep, &b, 1) < 0) {
	return -1;
    }
    return b;
}

int an2131_write_nothing(int ep) {
    return an2131_write(ep, NULL, 0);
}

/*--------------------------------------------*/
/* Functions using specific dragon's firmware */
/*--------------------------------------------*/

int dragon_read_i2c(int address, u8 * out, int size) {
    u8 cmd[] = {0x01, 0x00, 0x00}, reply[64];
    
    if (size > 63) {
	fprintf(stderr, "Error: i2c read too big.\n");
	return -1;
    }
    
    cmd[1] = size;
    cmd[2] = (address << 1) | 1;

    if (an2131_write(4, cmd, 3) < 0) return -1;
    if (an2131_read(0x84, reply, size + 1) < 0) return -1;
    
    memcpy(out, reply + 1, size);
    
    return reply[0];
}

int dragon_write_i2c(int address, const u8 * in, int size) {
    u8 cmd[64] = {0x01, 0x00, 0x00}, reply[1];
    
    if (size > 61) {
	fprintf(stderr, "Error: i2c write too big.\n");
	return -1;
    }
    
    cmd[1] = size + 1;
    cmd[2] = address << 1;
    memcpy(cmd + 3, in, size);
    if (an2131_write(4, cmd, 3 + size) < 0) return -1;
    if (an2131_read(0x84, reply, 1) < 0) return -1;
    
    return reply[0];
}

int dragon_probe_i2c(int address) {
    u8 dummy = 0;
    int r;

    r = dragon_write_i2c(address, &dummy, 0);

    return r == 0x41;
}

int dragon_read_eeprom(u8 * out, int address) {
    u8 cmd[] = {0x02, 0x03, 0xA2, 0x00, 0x00, 0x10, 0xA3}, reply[18];
    int i, j;

    cmd[2] = address << 1;
    cmd[6] = (address << 1) | 1;
    
    for (j = 0; j < 8192; j += 16) {
        cmd[3] = (j >> 8) & 255;
        cmd[4] = j & 255;
	if (an2131_write(4, cmd, 7) < 0) return -1;
        if (an2131_read(0x84, reply, 18) < 0) return -1;
	if ((reply[0] != 0x43) && (reply[1] != 0x50)) {
	    fprintf(stderr, "Error during eeprom read, got replies %02x and %02x.\n", reply[0], reply[1]);
	    return -1;
	}
        for (i = 2; i < 18; i++) {
            dprintf("%02x ", reply[i]);
        }
        dprintf("\n");
	memcpy(out + j, reply + 2, 16);
    }
    return 0;
}

int dragon_write_eeprom(const u8 * in, int size, int address) {
    u8 bytes[3] = {0x00, 0x00}, reply;
    int i;
    
    for (i = 0; i < size; i++) {
	bytes[2] = in[i];
	if ((reply = dragon_write_i2c(address, bytes, 3)) != 0x44) {
	    fprintf(stderr, "Error writing EEPROM byte %i, got %02x.\n", i, reply);
	    return -1;
	}
    }
    return 0;
}

int dragon_data_read(u8 * out, int size) {
    u8 data[2];
    
    data[0] = size & 255;
    data[1] = (size >> 8) & 255;
    
    if (!size) return 0;
    if (an2131_write(6, data, 2) < 0) return -1;
    if (an2131_read(0x84, out, size) < 0) return -1;
    return 0;
}

int dragon_data_write(const u8 * in, int size) {
    if (an2131_write(2, in, size) < 0) return -1;
    return 0;
}

int dragon_send_program(const u8 * in, int length) {
    int b, r;
    u8 * buffer;
    int i;
    
    // Phoenix hack
    if (an2131_write_u8(6, 0x4f) < 0) return -1;
    if (an2131_read_u8(0x86) < 0) return -1;

    if (an2131_write_u8(6, 0x01) < 0) return -1;
    if ((b = an2131_read_u8(0x86)) < 0) return -1;
    
    if (b != 0x11) {
	fprintf(stderr, "Dragon-FPGA doesn't behave correctly.\n");
	return -1;
    }
    
    if (an2131_write_u8(6, 0x41) < 0) return -1;
    if (an2131_read_u8(0x86) < 0) return -1;
    if (an2131_write_u8(6, 0x41) < 0) return -1;
    if ((b = an2131_read_u8(0x86)) < 0) return -1;
    
    if (b != 0xd1) {
	fprintf(stderr, "Dragon-FPGA didn't get ready for configuration.\n");
	return -1;
    }
    
    if (!(buffer = (u8 *) malloc(length))) {
	perror("memory allocation error");
	return -1;
    }

    for (i = 0; i < length; i++) {
	u8 c = in[i];
	
#define B(x, y) ((c & (1 << x)) ? (1 << y) : 0)
	buffer[i] = B(0, 0) | B(1, 1) | B(2, 2) | B(3, 3) |
	            B(4, 7) | B(5, 6) | B(6, 5) | B(7, 4);
#undef B
    }
    
    if ((r = usb_bulk_write(an2131_handle, 2, buffer, length, 10000)) != length) {
	if (r == -116) {
	    fprintf(stderr, "an2131 timeouted recieving the program.\n");
	} else if (r < 0) {
    	    perror("dragon");
	} else {
	    fprintf(stderr, "an2131 didn't recieved all the program.\n");
	}
        return -1;
    }

    free(buffer);
    
    if (an2131_write_u8(6, 0x41) < 0) return -1;
    if ((b = an2131_read_u8(0x86)) < 0) return -1;
    
    if (!(b & 0x20)) {
	fprintf(stderr, "Dragon-FPGA configuration failed.\n");
	if (!(b & 0x80)) {
	    fprintf(stderr, "Dragon-FPGA didn't like the bitfile, check target.\n");
	} else if (b == 0xd1) {
	    fprintf(stderr, "Dragon-FPGA didn't configure.\n");
	} else {
	    fprintf(stderr, "Dragon-FPGA configuration failed, err = %02x.\n", b);
	}
	return -1;
    }

// Dragon way    
//    an2131_write_nothing(6);
// Phoenix hack
    if (an2131_write_u8(6, 0x4e) < 0) return -1;
    if (an2131_read_u8(0x86) < 0) return -1;
    
    return 0;
}

/*--------------------------------------------*/

struct option long_options[] = {
    {"help",		0, NULL, 'h'},
    {"hex",		1, NULL, 'i'},
    {"raw",		1, NULL, 'r'},
    {"formatted",	1, NULL, 'f'},
    {"bit",		1, NULL, 'b'},
    {"rbt",		1, NULL, 't'},
    {0, 		0, NULL,  0 }
};

void showhelp() {
    fprintf(stderr, "Blah.\n");
}

int load_8051_program(char * hex, char * raw, char * formatted, u8 * memory) {
    int size;
    
    if (hex) {
        FILE * hex_file;
        
        if (!(hex_file = fopen(hex, "r"))) {
    	    perror(hex);
    	    return -1;
        }
	
	if ((size = load_hex_file(hex_file, memory, MEMORY_SIZE)) < 0) {
	    fprintf(stderr, "Error loading hex file.\n");
	    return -1;
	}
	fclose(hex_file);
    }
	
    if (raw) {
        FILE * raw_file;
	    
        if (!(raw_file = fopen(raw, "rb"))) {
    	    perror(raw);
	    return -1;
	}
	    
	fseek(raw_file, 0, SEEK_END);
	size = ftell(raw_file);
	fseek(raw_file, 0, SEEK_SET);
	// TODO: check size
	fread(memory, 1, size, raw_file);
	
	fclose(raw_file);
    }
	
    if (formatted) {
        FILE * formatted_file;
	u8 temp_buffer[EEPROM_SIZE];
	    
	if (!(formatted_file = fopen(formatted, "rb"))) {
	    perror(formatted);
	    return -1;
	}
	// TODO: check size
	fread(temp_buffer, 1, EEPROM_SIZE, formatted_file);
	    
	if ((size = unbuild_eeprom(temp_buffer, memory))) {
	    fprintf(stderr, "Error unbuilding eeprom.\n");
	    return -1;
	}
	    
	fclose(formatted_file);
    }
    
    return size;
}

int main(int argc, char ** argv) {
    char c, has_8051_program, has_fpga_program;
    char * cmd = NULL;
    char * hex = NULL, * raw = NULL, * formatted = NULL;
    char * bit = NULL, * rbt = NULL;

    printf("Initializing an2131 connection - please wait.\n");

    if (init_an2131()) {
	fprintf(stderr, "No an2131 found - exitting.\n");
	return -1;
    }

    printf("An2131 connection initialized.\n");
    
    while ((c = getopt_long(argc, argv, "Hhi:r:f:b:t:", long_options, NULL)) != EOF) {
	switch(c) {
	case 'i':
	    if (hex) {
		fprintf(stderr, "HEX file already specified.\n");
		return -1;
	    }
	    hex = strdup(optarg);
	    break;
	case 'r':
	    if (raw) {
		fprintf(stderr, "RAW file already specified.\n");
		return -1;
	    }
	    raw = strdup(optarg);
	    break;
	case 'f':
	    if (formatted) {
		fprintf(stderr, "EEPROM-formatted file already specified.\n");
		return -1;
	    }
	    formatted = strdup(optarg);
	    break;
	case 'b':
	    if (bit) {
		fprintf(stderr, "BIT file already specified.\n");
		return -1;
	    }
	    bit = strdup(optarg);
	    break;
	case 't':
	    if (rbt) {
		fprintf(stderr, "RBT file already specified.\n");
		return -1;
	    }
	    rbt = strdup(optarg);
	    break;
	default:
	    showhelp();
	    return 0;
	}
    }
    
    if ((optind + 1) != argc) {
	fprintf(stderr, "Needs one command.\n");
	showhelp();
	return -1;
    }
    
    if ((has_8051_program = ((hex ? 1 : 0) + (raw ? 1 : 0) + (formatted ? 1 : 0))) > 1) {
	fprintf(stderr, "More than one 8051 program file specified.\n");
	return -1;
    }
    
    if ((has_fpga_program = ((raw ? 1 : 0) + (rbt ? 1 : 0) + (bit ? 1 : 0))) > 1) {
	fprintf(stderr, "More than one FPGA program file specified.\n");
	return -1;
    }
    
    cmd = strdup(argv[optind]);
    
    if (!strcmp(cmd, "reboot")) {
	u8 memory[MEMORY_SIZE];
	int size;

	if (!has_8051_program) {
	    fprintf(stderr, "Has to specify one 8051 program file to reboot 8051.\n");
	    return -1;
	}
	
	memset(memory, 0, MEMORY_SIZE);
	
	if ((size = load_8051_program(hex, raw, formatted, memory)) < 0) {
	    fprintf(stderr, "Error loading 8051 program.\n");
	    return -1;
	}
	
	if (an2131_reboot(memory, size) < 0) {
	    fprintf(stderr, "Error rebooting 8051.\n");
	    return -1;
	}

	printf ("OK\n");

    } else if (!strcmp(cmd, "read-eeprom")) {
	u8 eeprom[EEPROM_SIZE];

	dragon_read_eeprom(eeprom, 0x51);
    } else if (!strcmp(cmd, "write-eeprom")) {
	u8 memory[MEMORY_SIZE];
	u8 eeprom[EEPROM_SIZE];
	int size;

	if (!has_8051_program) {
	    fprintf(stderr, "Has to specify one 8051 program file to write eeprom.\n");
	    return -1;
	}
	
	memset(memory, 0, MEMORY_SIZE);
	memset(eeprom, 0, EEPROM_SIZE);
	
	if (formatted) {
	    FILE * formatted_file;
	    
	    if (!(formatted_file = fopen(formatted, "rb"))) {
		perror(formatted);
		return -1;
	    }
	    
	    fseek(formatted_file, 0, SEEK_END);
	    size = ftell(formatted_file);
	    // TODO: check size
	    fseek(formatted_file, 0, SEEK_SET);
	    
	    fread(eeprom, 1, size, formatted_file);
	    fclose(formatted_file);
	} else {
	    if ((size = load_8051_program(hex, raw, NULL, memory)) < 0) {
		fprintf(stderr, "Error loading 8051 program.\n");
	        return -1;
	    }
	    
	    if ((size = build_eeprom(memory, eeprom, size, VID, PID, 0)) < 0) {
		fprintf(stderr, "Error building firmware.\n");
		return -1;
	    }
	}
	
	if (dragon_write_eeprom(eeprom, size, 0x51) < 0) {
	    fprintf(stderr, "Error writing eeprom.\n");
	    return -1;
	}
    } else if (!strcmp(cmd, "program")) {
	struct bithead bh;
	int size;
	FILE * bit_file;
	u8 * bitstream;
	
	if (!has_fpga_program) {
	    fprintf(stderr, "Needs to specify one bitstream file to programm FPGA.\n");
	    return -1;
	}
	
	if (bit) {
	    if (!(bit_file = fopen(bit, "rb"))) {
		perror(bit);
		return -1;
	    }
	
	    initbh(&bh);
	
    	    if (readhead(&bh, bit_file) < 0) {
		fprintf(stderr, "Error reading bitfile header.\n");
		return -1;
	    }
	
	    printf("Bit file created on %s at %s.\n", bh.date, bh.time);
	    printf("Created from file %s for Xilinx part %s.\n", bh.filename, bh.part);
	    printf("Bitstream length is %d bytes.\n", bh.length);
	
	    if (!(bitstream = (u8 *) malloc(bh.length))) {
		perror("bitstream allocation");
		return -1;
	    }
	
	    fread(bitstream, 1, size = bh.length, bit_file);
	    freebh(&bh);
	    fclose(bit_file);
	} else if (raw) {
	    if (!(bit_file = fopen(raw, "rb"))) {
		perror(raw);
		return -1;
	    }
	    
	    fseek(bit_file, 0, SEEK_END);
	    size = ftell(bit_file);
	    fseek(bit_file, 0, SEEK_SET);
	    
	    bitstream = (u8 *) malloc(size);
	    
	    fread(bitstream, 1, size, bit_file);
	    fclose(bit_file);
	} else if (rbt) {
	    // TODO: support RBT file format.
	    fprintf(stderr, "RBT file format not yet supported.\n");
	    return -1;
	}
	
	if (dragon_send_program(bitstream, size) < 0) {
	    fprintf(stderr, "Error programming FPGA.\n");
	    return -1;
	}
	
	free(bitstream);
    } else if (!strcmp(cmd, "probe")) {
	int i;
	for (i = 0; i < 127; i++) {
	    printf("Probing %i: %spresent.\n", i, dragon_probe_i2c(i) ? "" : "non ");
	}
    } else {
//      u8 c = atoi(cmd), b;
      	fprintf(stderr, "Command %s unknown.\n", cmd);
      	showhelp();
      return -1;
      // By default send cmd as value

      //if (an2131_write_u8(2, (u8)c) < 0)
//	fprintf (stderr, "Can't send %x\n", c);
 //     else
//	printf ("sent %0x\n", c);

    }

    return 0;
}
