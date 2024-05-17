
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Projeto_Teste_Fork

<!-- badges: start -->
<!-- badges: end -->

O Objetivo do projeto Projeto_Teste_Fork é fornecer informações
necessários para usuários inciais e intermediários aprenderem a usar o
Git/Github na interface RStudio.

# Instruções de uso inicias

1.  Crie uma conta gratuita no GitHub <https://github.com/>

2.  Download o Git neste link <https://git-scm.com/downloads>

3.  Instale o git e depois abra-o. Feche e reinicie o Rstudio para
    reconhecer o local de instalção

4.  Configurando via Rstudio

5.  Instale o pacote `usethis` e carregue-o

# Configure o Git/Github no RStudio

Vams usar o pacote usethis e os comando abaixo.

``` r
usethis::use_git_config(user.name = "Evaldo Martins", 
                        user.email = "evaldomartins@ufpa.br")
```

# Anexo de criação do arquivo Radme.rmd

Para criar o Readme.rmd usei a função `usethis::use_readme_rmd()` . O
que é especial sobre usar o `README.Rmd` em vez de apenas o `README.md`?
Você pode incluir chunks como este:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

Você ainda precisará renderizar `README.Rmd` regularmente, para manter
`README.md` atualizado.

Você também pode incorporar gráficos, por exemplo:

![](README_files/figure-gfm/pressure-1.png)<!-- -->

Nesse caso, não se esqueça de fazer o commit e enviar (push) os arquivos
de figura resultantes para que eles sejam exibidos no GitHub.
