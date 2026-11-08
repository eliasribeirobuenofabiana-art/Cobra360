DEVKITXENON ?= /usr/local/xenon
export DEVKITXENON

TARGET = cobra360
OBJS   = main.o

CXXFLAGS = -O2 -Wall

include $(DEVKITXENON)/rules

# Se o seu libxenon usar outro formato de rules, troque por:
#   $(TARGET).elf: $(OBJS)
#   	$(CXX) $(OBJS) $(LDFLAGS) -o $@

all: $(TARGET).elf32

$(TARGET).elf: $(OBJS)
	$(CXX) $(OBJS) $(LDFLAGS) -o $@

$(TARGET).elf32: $(TARGET).elf
	cp $< $@

clean:
	rm -f *.o *.elf *.elf32
