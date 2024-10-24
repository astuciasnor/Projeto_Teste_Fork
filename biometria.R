#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#
#             Criação de gráfico de Barras lado a lado ou Empilhado
#
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

library(ggplot2)
library(readr)

# Importando dados de biometria
dados <- read_csv("dados/biometria.csv")

# Visualizando o conjunto de dados 
print(dados)

# Criação do gráfico de barras lado a lado -------------------------------
ggplot(dados, aes(x = `Comprimento (cm)`, y = `Peso (g)`))

# Criação do gráfico de barras empilhadas ------------------------------
ggplot(dados, aes(x = Category, y = Value, fill = Group)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(title = "Gráfico de Barras Empilhadas",
       x = "Categoria",
       y = "Valor") +
  theme_minimal()

# Mudando a ordem dos grupos e fazendo novo gráfico
dados$Group <- factor(dados$Group, levels = c("Group3", "Group2", "Group1"))

ggplot(dados, aes(x = Category, y = Value, fill = Group)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(title = "Gráfico de Barras Empilhadas",
       x = "Categoria",
       y = "Valor") +
  theme_minimal()


