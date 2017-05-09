# $@    Nome da regra. 
# $<    Nome da primeira dependência 
# $^     Lista de dependências
# $?     Lista de dependências mais recentes que a regra.
# $*     Nome do arquivo sem sufixo

# Global Variable Declarations
CC= g++
FCLIB= -I ../../../LIBs

##root links and compiler flags
CFLAGS = -g -Wall `root-config --cflags`
LDFLAGS := `root-config --glibs`



SRC3= main.C Opt_spec1.C
OBJ3= $(SRC3:.C=.o)
EXE3= main.exe

SRC2= calibmain.C calibOpt.C
OBJ2= $(SRC2:.C=.o)
EXE2= calibmain.exe



##Routines
all: main calibmain 

## .o generator
%.o:%.C 
	@echo Installing Virus...
	$(CC)  -c  $(CFLAGS) $(FCLIB)   $<  -o $@ 


main: $(OBJ3)
	$(CC) -o $(EXE3) $(OBJ3) $(LDFLAGS) 
	@echo Hard Drive copied, sent and deleted. Shutting down...

calibmain: $(OBJ2)
	$(CC) -o $(EXE2) $(OBJ2) $(LDFLAGS) 
	@echo Hard Drive copied, sent and deleted. Shutting down...



clean:
	rm -rf *~ *.o $(EXE2) $(EXE3) $(EXE4)
