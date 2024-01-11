SRCDIR ?= /opt/fpp/src
include $(SRCDIR)/makefiles/common/setup.mk
include $(SRCDIR)/makefiles/platform/*.mk

all: libfpp-HomeAssistantRey.$(SHLIB_EXT)
debug: all

CFLAGS+=-I.
OBJECTS_fpp_HomeAssistantRey_so += src/FPP-HomeAssistantRey.o
LIBS_fpp_HomeAssistantRey_so += -L$(SRCDIR) -lfpp -ljsoncpp -lhttpserver
CXXFLAGS_src/FPP-HomeAssistantRey.o += -I$(SRCDIR)


%.o: %.cpp Makefile
	$(CCACHE) $(CC) $(CFLAGS) $(CXXFLAGS) $(CXXFLAGS_$@) -c $< -o $@

libfpp-HomeAssistantRey.$(SHLIB_EXT): $(OBJECTS_fpp_HomeAssistantRey_so) $(SRCDIR)/libfpp.$(SHLIB_EXT)
	$(CCACHE) $(CC) -shared $(CFLAGS_$@) $(OBJECTS_fpp_HomeAssistantRey_so) $(LIBS_fpp_HomeAssistantRey_so) $(LDFLAGS) -o $@

clean:
	rm -f libfpp-HomeAssistantRey.so $(OBJECTS_fpp_HomeAssistantRey_so)

