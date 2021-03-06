# Example: Substitutions in HRas protein in human cancer, csv file from COSMIC v92.
# Read table
View(HRas)
# List objects wish to be counted
HRas$'AA Mutation'
# Convert into table with frequency
table(HRas$'AA Mutation')
# Define objects in table line 7
H_object = table(HRas$'AA Mutation')
H_object
# Generate data frame, results should be generated at this step
as.data.frame(H_object)
# Change title of data frame
HRas_Mutation = as.data.frame(H_object)
names(H_object) = c("AASH", "Count")
# Display new table line 16
H_object
