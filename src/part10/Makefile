PROGRAM = CLI_ARG

BIN_DIR = ./bin
OUT_DIR = ./build
SRC_DIR = ./src

TARGET = $(OUT_DIR)/$(PROGRAM)

COMPILER = gcc
C_FLAGS = -O2
LD_FLAGS = -lfl

.PHONY: build
build: prepare $(PROGRAM).tab.c $(PROGRAM).lex.yy.c
	$(COMPILER) $(C_FLAGS) -o $(TARGET) $(OUT_DIR)/$(PROGRAM).tab.c $(LD_FLAGS)
	@if [ ! -e $(BIN_DIR)/$(PROGRAM) -o $(TARGET) -nt $(BIN_DIR)/$(PROGRAM) ]; then \
		cp $(TARGET) $(BIN_DIR)/$(PROGRAM); \
	else \
		echo "No need to copy '$(TARGET)' to '$(BIN_DIR)/$(PROGRAM)'."; \
	fi

.PHONY: dev
dev: build start

.PHONY: start
start:
	$(BIN_DIR)/$(PROGRAM) $(ARGS)

.PHONY: prepare
prepare:
	@[ -d $(BIN_DIR) ] || mkdir -p $(BIN_DIR)
	@[ -d $(OUT_DIR) ] || mkdir -p $(OUT_DIR)

.PHONY: clean
clean:
	@if [ -d $(BIN_DIR) ] || [ -d $(OUT_DIR) ]; then \
		rm -rf $(BIN_DIR) $(OUT_DIR); \
	else \
		echo "No need to clean."; \
	fi

$(PROGRAM).tab.c: $(PROGRAM).y
	bison $(PROGRAM).y -o $(OUT_DIR)/$(PROGRAM).tab.c

$(PROGRAM).lex.yy.c: $(PROGRAM).l
	flex -o $(OUT_DIR)/$(PROGRAM).lex.yy.c $(PROGRAM).l

$(TARGET): $(OBJS)
	$(COMPILER) -o $@ $^ $(LD_FLAGS)

$(OUT_DIR)/%.o:%.c
	@if [ ! -e `dirname $@` ]; then mkdir -p `dirname $@`; fi
	$(COMPILER) $(C_FLAGS) -o $@ -c $<
