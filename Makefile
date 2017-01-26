#------------------------------------------------------------------------------
# Project's name
# #------------------------------------------------------------------------------
PROGRAM = alpha_pearson
CC = Rscript
SOURCE = alpha_pearson.R
BIN_DIR = bin

.PHONY: clean

all: $(PROGRAM)

$(PROGRAM): $(SOURCE)
	@echo "Initing process..."
	@echo "Calc..."
	@$(CC) $(SOURCE)
	@echo "Done!"

clean:
	@echo "Excluding..."
	@echo "Clean executables..."
	rm -rf $(BIN_DIR)
	@echo "Ready exclusion!"
