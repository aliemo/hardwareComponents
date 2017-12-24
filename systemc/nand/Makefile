SYSTEMC_VERSION:=2.3.3
GTKWAVE:= which gtkwave
TARGET := reference
CXX := g++
LD := $(CXX) 
C_FLAGS := -I/usr/local/systemc-${SYSTEMC_VERSION}/include -O0 -g3 -Wall -c
LD_OPTIONS = -L/usr/local/systemc-2.3.3/lib-linux64 -o $(TARGET)
LIBS := -lsystemc
C_SOURCES = $(shell ls *.cc)
C_OBJS := $(patsubst %.cc, %.o, $(C_SOURCES))

%.o:%.cc
	@echo 'Building file: $(@F)'
	@echo '--------------------'
	@echo 'Invoking: GNU CPP Compiler'
	$(CXX) $(C_FLAGS) $< -o $@
	@echo 'Finished building: $(@F)'
	@echo ' '

all:$(TARGET) 

$(TARGET): $(C_OBJS)
	@echo 'building binary $(@F)'
	$(LD) $(LD_OPTIONS) $(C_OBJS) $(LIBS)

prerequisites: 
ifneq ('$(GTKWAVE)', "/usr/bin/gtkwave")
	@echo $(GTKWAVE)
	@echo 'installing gtkwave, please be patient'
	# sudo apt install -y gtkwave
	# sudo dnf install -y gtkwave
endif

test:$(TARGET)
	./$(TARGET) 
	gtkwave -c 4 vcd_trace.vcd

clean:
	rm -f $(TARGET) *.o vcd_trace.vcd
.PHONY: $(TARGET)
