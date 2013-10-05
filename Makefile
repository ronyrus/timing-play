OBJS=target.o
target: $(OBJS)
all: target
clean:
	rm $(OBJS) target
