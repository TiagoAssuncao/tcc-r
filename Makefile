#------------------------------------------------------------------------------
# Alpha and Pearson using R
#------------------------------------------------------------------------------
PROGRAM = alpha_pearson
CC = Rscript
SOURCE = statistics.R
BIN_DIR = bin

.PHONY: clean

all: $(PROGRAM)

$(PROGRAM): $(SOURCE)
	@echo "Initing process..."
	@$(CC) $(SOURCE)
	@echo "Done!"

clean:
	@echo "Excluding..."
	@echo "Clean executables..."
	rm -rf $(BIN_DIR)
	@echo "Ready exclusion!"
