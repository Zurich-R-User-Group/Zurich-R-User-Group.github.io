
library("ggplot2")
letter <- "R"
df <- data.frame(x = 1, y = 1, label = "R")

p <- ggplot(df, aes(x = x, y = y, label = label)) +
  geom_text(size = 100, color = "white") +
  theme(panel.background = element_rect(fill = '#E11A27'),
        panel.grid.minor = element_line(colour = '#E11A27'),
        panel.grid.major = element_line(colour = '#E11A27'))

ggsave("_files/plot_logo.png", plot = p, width = 7, height = 7)
