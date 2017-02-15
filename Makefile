SRCDIR = src/
INCDIR = ./include
OBJDIR = objs/
SIMDIR = sims/

OBJECTS := objs/detector.o objs/plf.o objs/frag.o objs/tele.o objs/array.o objs/sle.o objs/decay.o objs/loss.o objs/mScat.o objs/fragment.o objs/random.o objs/tower.o objs/frame.o objs/MomDist.o objs/moscow.o objs/ring.o objs/ttt.o objs/plane_det.o

#ALLOBJECTS = $(wildcard $(SRCDIR)*.cpp)

ALLOBJECTS := $(patsubst $(SRCDIR)%.cpp,$(OBJDIR)%.o,$(wildcard $(SRCDIR)*.cpp))

CFLAGS= -c -g -std=c++11 -I$(shell root-config --incdir) -I$(INCDIR)
COMPILER= c++
LINKOPTION = $(shell root-config --libs) 

all: simCa34 simK33

simK33: $(OBJDIR)simK33.o $(OBJECTS)
	$(COMPILER) -o sims/simK33 $(OBJDIR)simK33.o $(OBJECTS) $(LINKOPTION)

simCa34: $(OBJDIR)simCa34.o $(OBJECTS)
	$(COMPILER) -o sims/simCa34 $(OBJDIR)simCa34.o $(OBJECTS) $(LINKOPTION)

$(ALLOBJECTS) : $(OBJDIR)%.o : $(SRCDIR)%.cpp
	$(COMPILER) $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJDIR)*.o

