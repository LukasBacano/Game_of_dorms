# https://challenges.ecsc.eu/challenges/game-of-dorms

#Someone in the student dorms is asking for help. They forgot the password to an important archive(thesis.zip).
#The only thing the student recalls is that the password he used is linked to his birthday: 26 11 1997 and to one of the characters in
#Game of Thrones: A Song of Ice and Fire
#
#So, for example, if the character he chose was Eddard Stark, the password
#could be any of the following:
#EddardStark19971126
#Eddard199711Stark26
#11EddardStark199726




library(rvest)
library(stringr)
library(gtools)
library(zip)

# Step 1: Scrape Character Names
url <- "https://en.wikipedia.org/wiki/List_of_A_Song_of_Ice_and_Fire_characters"
webpage <- read_html(url)

# Extract character names from h3 headers
GoTNames <- webpage %>%
  html_nodes("h4") %>%
  html_text(trim = TRUE) %>%
  gsub("\\[edit\\]", "", .) %>%
  .[nchar(.) > 0]

# Step 2: Define birthday components
date_parts <- c("26", "11", "1997")

# Step 3: Generate passwords for each character
passwords <- unlist(lapply(GoTNames, function(name) {
  elements <- c(unlist(str_split(name, " ")), date_parts)
  apply(permutations(length(elements), length(elements), elements), 1, paste0, collapse = "")
}))

# Step 4: Save passwords to file
#writeLines(passwords, "GoT_passwords.txt")

# Step 5: Bruteforce ZIP file
zip_file <- "Downloads/thesis.zip"  # Update path if needed
password_list <- "GoT_passwords.txt"
output_dir <- "unzipped_files"

dir.create(output_dir, showWarnings = FALSE)  # Ensure output directory exists

passwords <- readLines(password_list)

for (pwd in passwords) {
  cat("Trying password:", pwd, "\n")
  
  # Use proper quoting to handle special characters
  cmd <- paste("unzip -P", shQuote(pwd), "-o", shQuote(zip_file), "-d", shQuote(output_dir))
  result <- system(cmd, intern = TRUE)
  
  # Check for successful extraction
  if (any(grepl("extracting|inflating", tolower(result)))) {
    cat("\nPassword found:", pwd, "\n")
    break
  }
}

#Password found: 11EddardStark199726