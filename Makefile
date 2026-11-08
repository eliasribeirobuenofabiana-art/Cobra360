DEVKITXENON ?= /usr/local/xenon
export DEVKITXENON

TARGET = cobra360
OBJS   = main.o

include $(DEVKITXENON)/rules

.RECIPEPREFIX = >
.DEFAULT_GOAL := all

all: $(TARGET).elf32

main.o: main.cpp
> $(CXX) -O2 -Wall -DXENON -m32 -maltivec -fno-pic -mpowerpc64 -I$(DEVKITXENON)/usr/include -c main.cpp -o main.o

$(TARGET).elf: $(OBJS)
> $(CXX) $(OBJS) $(LDFLAGS) -o $@

$(TARGET).elf32: $(TARGET).elf
> cp $< $@

clean:
> rm -f *.o *.elf *.elf32
