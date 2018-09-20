# install.packages("DiagrammeR")
library(DiagrammeR)
library(dplyr)
ndf = create_node_df(n = 5, label = TRUE)
ndf$label = c("MOT", "Census", "Traffic", "Processing", "Scenarios")
ndf$shape = "square"
ndf$shape[4] = "triangle"
ndf$shape[5] = "circle"

edf = create_edge_df(
  from = c(1, 2, 3, 4),
  to = c(4, 4, 4, 5)
)
g = create_graph(nodes_df = ndf, edges_df = edf, graph_name = "cyipt", directed = TRUE)

# save_graph(x = g, file = "g.dot")
# generate_dot(g) %>% 
#   grViz()

# DiagrammeR::mermaid(g)

# mermaid("
# graph LR
# A(OSM)-->D[Road Network]
# B[PCT]-->D[Road Network]
# C[MasterMap]-->D[Road Network]
# ")

