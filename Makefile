STDC = c90

_DEPS = \
	hello.h

_OBJS = \
	main.o \
	hello.o

LIBS = -lm
_APP = app

SDIR = source
IDIR = include
ODIR = build/obj
BDIR = build/bin

WARNINGS = \
	-Wpedantic \
	-Wall \
	-Wextra \
	-Wdouble-promotion \
	-Wformat \
	-Winit-self \
	-Wswitch-default \
	-Wswitch-enum \
	-Wuse-after-free \
	-Wmaybe-uninitialized \
	-Walloc-zero \
	-Warray-parameter \
	-Wduplicated-branches \
	-Wduplicated-cond \
	-Wfloat-equal \
	-Wshadow \
	-Wpointer-arith \
	-Wno-pointer-compare \
	-Wundef \
	-Wc90-c99-compat \
	-Wcast-qual \
	-Wcast-align=strict \
	-Wcast-function-type \
	-Wlogical-op \
	-Wno-long-long

CFLAGS = \
	-I$(IDIR) -std=$(STDC) $(WARNINGS)

APP = $(patsubst %,$(BDIR)/%,$(_APP))
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))
OBJS = $(patsubst %,$(ODIR)/%,$(_OBJS))

.PHONY: clean run

$(ODIR)/%.o: $(SDIR)/%.c $(DEPS)
	@$(CC) -c -o $@ $< $(CFLAGS)

$(APP): $(OBJS)
	@$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

run: $(APP)
	@./$(APP) $(ARGS)

$(OBJS): | $(ODIR)

$(ODIR):
	@mkdir -p $(ODIR)

$(APP): | $(BDIR)

$(BDIR):
	@mkdir -p $(BDIR)

clean:
	rm -f $(ODIR)/*.o $(BDIR)/* *~ $(SDIR)/*~ core $(IDIR)/*~
