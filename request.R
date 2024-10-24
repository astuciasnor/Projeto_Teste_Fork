#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#
#                      PRATICANDO O PULL REQUEST
#
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

# Crie um vetor x numérico aqui -----------------------------------------------

X <- -10:10

# Crie um vetor y em função do vetor x acima ----------------------------------

y <- X^3

# Crie um dataframe chamado df unindo os vetores x e y ------------------------



# Crie um grafico de pontos com o dataframe df o ggplot -----------------------
library(ggplot2)

df |>  
  ggplot(aes(x = X, y = y)) +
  geom_point()



# Adicione ao gráfico ma curva de tendência suavizada(smooth) -----------------
