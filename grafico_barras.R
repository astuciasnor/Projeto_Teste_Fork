#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#
#             Criação de gráfico de Barras lado a lado ou Empilhado
#
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

library(ggplot2)
# Criação de um conjunto de dados de exemplo
data <- data.frame(
  Group = rep(c("Group1", "Group2", "Group3"), each = 3),
  Category = rep(c("A", "B", "C"), times = 3),
  Value = c(4, 3, 8, 6, 7, 5, 15, 2, 6)
)

# Visualizando o conjunto de dados 
print(data)

# Criação do gráfico de barras lado a lado -------------------------------
ggplot(data, aes(x = Category, y = Value, fill = Group)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  labs(title = "Gráfico de Barras com Grupos Lado a Lado",
       x = "Categoria",
       y = "Valor") +
  theme_minimal()

# Criação do gráfico de barras empilhadas ------------------------------
ggplot(data, aes(x = Category, y = Value, fill = Group)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(title = "Gráfico de Barras Empilhadas",
       x = "Categoria",
       y = "Valor") +
  theme_minimal()

# Mudando a ordem dos grupos e fazendo novo gráfico
data$Group <- factor(data$Group, levels = c("Group3", "Group2", "Group1"))

ggplot(data, aes(x = Category, y = Value, fill = Group)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(title = "Gráfico de Barras Empilhadas",
       x = "Categoria",
       y = "Valor") +
  theme_minimal()


