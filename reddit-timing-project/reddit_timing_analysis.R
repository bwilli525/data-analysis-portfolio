# ============================================================================
# Timing Isn't Everything: Post Timing and Engagement on r/AskReddit
# Author: Brett Williams
# This script examines whether the full date‑time of a post on r/AskReddit
# predicts the number of comments it receives.
# ============================================================================

# Load required packages
library(RedditExtractoR)
library(ggplot2)
library(dplyr)
library(lubridate)

# 1. Collect thread URLs from r/AskReddit (sorted by new, all time)
threads <- find_thread_urls(
  keywords = NA,
  subreddit = "AskReddit",
  sort_by = "new",
  period = "all"
)

# 2. Extract thread content (optional, for completeness)
thread_content <- get_thread_content(threads$url)

# 3. Extract timestamps and comment counts
timestamps <- as.POSIXct(threads$timestamp, origin = "1970-01-01", tz = "UTC")
num_comments <- sapply(threads$comments, abs)

# 4. Create data frame
data <- data.frame(
  timestamp = timestamps,
  comments = num_comments
)

# 5. Linear regression analysis
model <- lm(comments ~ timestamp, data = data)
summary(model)

# 6. Scatter plot with regression line
ggplot(data, aes(x = timestamp, y = comments)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(
    title = "Post Timing vs. Comment Engagement on r/AskReddit",
    x = "Time of Post (UTC)",
    y = "Number of Comments"
  ) +
  theme_minimal()

# 7. Optional: Save data snapshot for reproducibility
write.csv(data, "reddit_timing_data.csv", row.names = FALSE)
