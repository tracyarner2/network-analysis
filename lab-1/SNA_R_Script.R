#install.packages("readxl")
library(readxl)
library(tidygraph)
library(ggraph)
library(tidyverse)
student_nodes <- read_excel("lab-1/data/student-attributes.xlsx")
student_edges <- read_excel("lab-1/data/student-edgelist.xlsx")

view(student_nodes)
view(student_edges)

student_network <- tbl_graph(edges = student_edges,
                             nodes = student_nodes, 
                             directed = TRUE)
student_network
plot(student_network)
autograph(student_network)

ggraph(student_network, layout = "stress") +
  geom_edge_link(arrow = arrow(length = unit(1, 'mm')), 
                 end_cap = circle(3, 'mm'),
                 start_cap = circle(3, 'mm'),
                 alpha = .1) +
  geom_node_point(aes(size = local_size(),
                      color = gender)) +
  geom_node_text(aes(label = id),
                 repel=TRUE) +
  theme_graph()
