SUBDIRS = IO MEM

USER_PROG=


all: $(USER_PROG)
	@for dir in $(SUBDIRS); do \
	  $(MAKE) -C $$dir; \
	done

clean:
	rm -f $(USER_PROG) *~
	@for dir in $(SUBDIRS); do \
	  $(MAKE) -C $$dir clean; \
	done

install:
	cp $(USER_PROG) /usr/local/bin
	@for dir in $(SUBDIRS); do \
	  $(MAKE) -C $$dir install; \
	done
