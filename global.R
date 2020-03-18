library(readr)

#read csv file
data_json <- read_csv("Data/data_json.csv")

# creating subsets of data (the csv file) maybe data base should be in a proper database
df_CCSD <- data_json["CCSD"]
df_temp <- data_json["ASI"]
df_master <- unique(df_temp)
