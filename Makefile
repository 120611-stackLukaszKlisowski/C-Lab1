CC := gcc
CFLAGS := -std=c99 -Wall -Wextra -Wpedantic -g
CPPFLAGS := -Iinclude
BUILD_DIR := build
SRC_DIR := src
TEST_DIR := tests

APP := $(BUILD_DIR)/app
TESTS := $(BUILD_DIR)/tests

SRC := $(wildcard $(SRC_DIR)/*.c)
TEST_SRC := $(wildcard $(TEST_DIR)/*.c)

APP_OBJS := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRC))
TEST_OBJS := $(patsubst $(TEST_DIR)/%.c,$(BUILD_DIR)/tests_%.o,$(TEST_SRC))

.PHONY: all clean run test dirs

all: dirs $(APP)

dirs:
	mkdir -p $(BUILD_DIR)

$(APP): $(APP_OBJS)
	$(CC) $(CFLAGS) $(CPPFLAGS) $^ -o $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | dirs
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

$(TESTS): $(APP_OBJS) $(TEST_OBJS)
	$(CC) $(CFLAGS) $(CPPFLAGS) $^ -o $@

$(BUILD_DIR)/tests_%.o: $(TEST_DIR)/%.c | dirs
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

run: $(APP)
	./$(APP)

test: dirs $(TESTS)
	./$(TESTS)

clean:
	rm -rf $(BUILD_DIR)