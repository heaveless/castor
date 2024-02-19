# Dependencies

RAYLIB_REPO = https://github.com/raysan5/raylib.git
RAYLIB_DIR = raylib

# Configuration

APP = castor
CC = clang
CFLAGS = -Wall -I$(RAYLIB_DIR)/src
LDFLAGS = -L$(RAYLIB_DIR)/src -lraylib -lm -lpthread -ldl -lrt -lX11

SOURCES = src/$(APP).c
EXECUTABLE = $(APP)

$(RAYLIB_DIR):
	git clone $(RAYLIB_REPO) $(RAYLIB_DIR)

$(RAYLIB_DIR)/src/libraylib.a: | $(RAYLIB_DIR)
	$(MAKE) -C $(RAYLIB_DIR)/src PLATFORM=PLATFORM_DESKTOP

$(EXECUTABLE): $(SOURCES) $(RAYLIB_DIR)/src/libraylib.a
	$(CC) $(CFLAGS) $(SOURCES) -o $(EXECUTABLE) $(LDFLAGS)

all: $(EXECUTABLE)

$(EXECUTABLE): $(SOURCES) | $(RAYLIB_DIR)
	$(CC) $(CFLAGS) $(SOURCES) -o $(EXECUTABLE) $(LDFLAGS)

clean:
	rm -f $(EXECUTABLE)
	$(MAKE) -C $(RAYLIB_DIR)/src clean

run: $(EXECUTABLE)
	./$(EXECUTABLE)

.PHONY: all clean run
