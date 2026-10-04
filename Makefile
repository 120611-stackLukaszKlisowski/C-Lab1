CC := gcc
CFLAGS := -std=c99 -Wall -Wextra -Wpedantic -g
CPPFLAGS := -Iinclude
BUILD_DIR := build
SRC_DIR := src

SRC := $(wildcard $(SRC_DIR)/*.c)
OBJS := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRC))

APP := $(BUILD_DIR)/app

.PHONY: all clean run test dirs

all: dirs $(APP)

dirs:
	mkdir -p $(BUILD_DIR)

$(APP): $(OBJS)
	$(CC) $(CFLAGS) $(CPPFLAGS) $^ -o $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | dirs
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

run: $(APP)
	./$(APP)

test: $(APP)
	bash tests/run_tests.sh

clean:
	rm -rf $(BUILD_DIR) tests/*/actual.txt