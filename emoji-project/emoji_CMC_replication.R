# ============================================================================
# Emoji Use and Perceived CMC Effectiveness - Replication of Published Results
# Author: Brett Williams
# Publication: Communication Research Reports (2026)
# DOI: 10.1080/08824096.2025.2609671
# ============================================================================

# Load data
emoji_data <- read.csv("C:/Users/Brett/OneDrive - University of Connecticut/UCONN/Projects/COMPLETE/Emoji Study/emoji_survey_data_anonymized.csv")

# Select variables for CMC effectiveness model (no controls)
vars_cmc <- c("CMC_Effectiveness_Composite",
              "Emoji_Use_Motive_Express_Feeling_To_Others",
              "Emoji_Use_Motive_Strengthen_Message_Content",
              "Emoji_Use_Motive_Soften_Message_Content",
              "Emoji_Use_Motive_Make_Content_Ironic_Sarcastic",
              "Emoji_Use_Motive_Make_Content_Fun_Comic",
              "Emoji_Use_Motive_Make_Content_Serious",
              "Emoji_Use_Motive_Make_Content_Positive",
              "Emoji_Use_Motive_Make_Content_Negative",
              "Emoji_Use_Motive_Express_Images_Not_Words")

# Complete cases
cmc_complete <- na.omit(emoji_data[vars_cmc])
cat("N for CMC effectiveness model:", nrow(cmc_complete), "\n")

# Run regression (no controls)
model_cmc <- lm(CMC_Effectiveness_Composite ~
                  Emoji_Use_Motive_Express_Feeling_To_Others +
                  Emoji_Use_Motive_Strengthen_Message_Content +
                  Emoji_Use_Motive_Soften_Message_Content +
                  Emoji_Use_Motive_Make_Content_Ironic_Sarcastic +
                  Emoji_Use_Motive_Make_Content_Fun_Comic +
                  Emoji_Use_Motive_Make_Content_Serious +
                  Emoji_Use_Motive_Make_Content_Positive +
                  Emoji_Use_Motive_Make_Content_Negative +
                  Emoji_Use_Motive_Express_Images_Not_Words,
                data = cmc_complete)

# Standardized coefficients to match Table 2
library(lm.beta)
summary(lm.beta(model_cmc))