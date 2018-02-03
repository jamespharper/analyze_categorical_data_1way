# Title: Analyze Categorical Data, One Way
# Desription: Analyze a categorical dataset using frequency tables
# Author: James Harper, PE, ENV SP
# Date Created: February 3, 2018
# -----------------------------------------------------------------------------

library(rio)

data = import("example_dataset_categorical.xlsx")

# Run 1-way categorical analyses
print("Running one-way tests...")
for (num in 1:length(data)) {
  print(num)
  metric1 = num
  # Create temporary vector from data
  A = data[metric1][[1]]
  
  # Perform categorical analyses and store results for printing below
  freqs = table(A)                                                       # Create frequency table
  freqs_prop = prop.table(freqs)                                         # Create proportions table
  freqs_prop_df = data.frame(Response = names(freqs_prop), 
                             Proportion = as.numeric(freqs_prop))
  freqs_prop_df = freqs_prop_df[order(-freqs_prop_df$Proportion),]
  
  # Create file name variable
  name = paste("freqs_1way_", names(data)[[metric1]], sep = "")
  
  # Start sending text output to text file
  file1 = file(paste(getwd(),"/Output/", name, ".txt", sep = ""))
  sink(file1, append = TRUE)
  sink(file1, append = TRUE, type = "message")
  
  # Add title to text file
  print(paste("A = ", names(data)[[metric1]], sep = ""))
  
  # Print results of analyses to text file
  print(summary(freqs))
  print(freqs)
  print(freqs_prop_df)
  
  # Stop sending text output to file
  sink()
  sink(type = "message")
  closeAllConnections()
}
print("One-way tests completed.")