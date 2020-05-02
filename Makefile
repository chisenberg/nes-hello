NAME = hello
EMULATOR = fceux

build:
	ca65 $(NAME).s -o output/$(NAME).o
	ld65 -C inc/memory.cfg -m output/map.txt -o output/$(NAME).nes output/$(NAME).o

clean:
	rm -f output/*

play: output/$(NAME).nes
	$(EMULATOR) output/$(NAME).nes

all: clean build play