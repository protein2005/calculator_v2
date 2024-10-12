# Compilation variables
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17
TARGET = calculator_exec
LIBRARY = libcalculator.a

# Files
SOURCES = main.cpp calculator.cpp
HEADERS = calculator.h
OBJECTS = $(SOURCES:.cpp=.o)

# Create a static library
$(LIBRARY): calculator.o
	ar rcs $(LIBRARY) calculator.o

# Build the executable
$(TARGET): main.o $(LIBRARY)
	$(CXX) $(CXXFLAGS) -o $(TARGET) main.o -L. -lcalculator

# Compile object files
%.o: %.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean up generated files
clean:
	rm -f $(OBJECTS) $(TARGET) $(LIBRARY)

.PHONY: all clean
