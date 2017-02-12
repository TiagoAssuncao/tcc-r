# Goals: read a table and calcs pearson, alpha and Guttman’s Lambda

# List of packages to install
print("Install packages...")
list.of.packages <- c("readODS", "psy", 'psych')

# Install packages only if dont exists
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
print("Done!")

# Load libraries to read ods tables, calcs alpha and pearson
print("Loading libraries...")
library(readODS, psy)
library(psych)
print("Done!")

# Read table ods
print("Calc results...")
table_votes = read_ods("table.ods", col_names = TRUE)

# Remove columns from dataframe where ALL values are NA
table_votes <- table_votes[,colSums(is.na(table_votes))<nrow(table_votes)]

# Calcule alpha with no negatives values
result_alpha = alpha(table_votes, na.rm = TRUE, check.keys=TRUE)

# Create dir to csv if dont exists
dir.create(file.path(getwd(), 'bin'), showWarnings = FALSE)

# Write a output with all results of alpha
print("Save output files...")
write.csv(result_alpha[3], file = "bin/alpha_each_item.csv")
write.csv(result_alpha[2], file = "bin/alpha_averange.csv")
write.csv(result_alpha[1], file = "bin/alpha.csv")

# Calculate cor of pearson
result_pearson = cor(table_votes)

# Write csv with result of pearson
write.csv(result_pearson, file = "bin/pearson.csv")
print("Finish!")
