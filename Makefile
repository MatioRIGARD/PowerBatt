
PRJ_NAME = PRJ_BATT_RAW
CC       = sdcc
CFLAGS   = -mstm8 -lstm8 --opt-code-size

OUT_DIR = SDCC
PRJ_HEX = $(OUT_DIR)/$(PRJ_NAME).hex

SRC_DIR = lib/src
INC_DIR = lib/inc

PRJ_SRC  = $(notdir $(wildcard $(SRC_DIR)/*.c))
PRJ_OBJ := $(addprefix $(OUT_DIR)/, $(PRJ_SRC:.c=.rel))

INCLUDE = -I$(INC_DIR) -I$(SRC_DIR) 

all: build flash

build: $(PRJ_HEX)

$(PRJ_HEX): $(PRJ_OBJ) $(OUT_DIR)/main.rel
	$(CC) $(CFLAGS) $? -o $(PRJ_HEX)

# main
$(OUT_DIR)/main.rel: main.c
	$(CC) $(CFLAGS) $(INCLUDE) -o $(OUT_DIR)/main.rel -c main.c

# libs
$(OUT_DIR)/%.rel: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) $(INCLUDE) -o $@ -c $<

clean:
	rm -f $(OUT_DIR)/*

flash:
	stm8flash -c stlinkv2 -p stm8l052c6 -w $(PRJ_HEX)
