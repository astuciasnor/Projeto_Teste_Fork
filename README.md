
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Modelo Para Usar Controle de Version (Clonar e/ou Bifurcar (Fork)) de Projetos

<!-- badges: start -->
<!-- badges: end -->

O Objetivo do projeto Projeto_Teste_Fork é fornecer informações
necessários para usuários inciais e intermediários aprenderem a usar o
Git/Github na interface RStudio para usar Controle de Versão de
Projetos.

# Instruções de uso inicias

1.  Crie uma conta gratuita no GitHub <https://github.com/>

2.  Download o Git neste link <https://git-scm.com/downloads>

3.  Instale o git e depois abra-o. Feche e reinicie o Rstudio para
    reconhecer o local de instalção

4.  Configurando via Rstudio

    Instale o pacote `usethis` e carregue-o

``` r
# library(usethis)
```

# Configure o Git/Github no RStudio

5.  Vamos usar o pacote `usethis` e os comando abaixo.

``` r
# usethis::use_git_config(user.name = "Evaldo Martins", 
#                         user.email = "evaldomartins@ufpa.br")
```

6.  Criar um novo token ou regenerar o token (codigo de 40 dig serão
    produzido)

``` r
# usethis::create_github_token() # Muda para o site do github para fazer login
```

Depois que fizer login, gere o token na própria página do github e o
copie. Após copiar, Você deverá colocar esse número no arquivo
.Renviron. O .Renviron é um arquivo de configuração do R que permite que
você especifique variáveis de ambiente para que fiquem disponíveis para
o R. Ele é muito usado para disponibilizar senhas, chaves de API, etc. -
coisas que são secretas - e por isso não é boa prática colocá-las no
código.

7.  **Abra o o arquivo .Renviron**

``` r
# usethis::edit_r_environ()
```

9.  Crie uma nova linha nesse arquivo digitando primeiramente :
    GITHUB_PAT=SEU_TOKEN. Exemplo:

GITHUB_PAT=ghp_Ko3mdlNJpBzQ7lvzKTvGFg91f6HpBQlablalba

9)  Após adicionar o token copiado do site, pule uma linha e salve o
    arquivo. \# 10) Reinicie o RStudio: CTRL + SHIFT + F10

# Como criar repositório

## Criando repositório primeiro no Github

1.  A forma mais eficiente é fazer via o site do Github, pois tudo fica
    configurado

2.  Clique no notão New

3.  Preencha conforme figura abaixo

<img src="images/clipboard-142360520.png" width="637" />

4.  Clone o repositório para que seja criado na sua máquina

<img src="images/clipboard-3984491672.png" width="376" />

5.  Em seguida, no RStudio, você pode criar um novo Projeto indo em
    File–\> New project e escolha a opção de Version Control –\> Git e
    coloque a url do repositório e especifique a pasta onde será salvo o
    repositório
6.  Ao fazer desta maneira, o respositório já acionou o git no seu
    computador e o vinculou também o Github na internet

## Criando no seu proprio computador primeiro

Não é forma mais recomendada, mas é possível fazer assim.

``` r
# usethis::create_project(path = "D:/Git/Clube_Codigo/Nome_Projeto")
# usethis::use_git()    # Digite no console desse projeto para ligá-lo ao Git
# usethis::use_github() # Digite no console desse projeto para levá-lo ao Github
```

Você também pode partir de um projeto já existem em seu computador e
depois só usar as duas linhas de comando acima para ligá-lo ao git e
carregá-lo ao Github.

## Clonando e bifurcando um respositório (fork)

Quando queremos trabalhar em colaboração com amis uma ou duas pessoas,
podemos clonar um respositório e bifurcar esse repositório. Para isso,
utilize os comandos abaixo.

``` r
  # usethis::create_from_github(
  #     repo_spec = "https://github.com/Evaldo-Martins-STAT/Projeto_Teste_Fork",
  #     destdir = "D:/Git/Clube_Codigo/",
  #     fork = TRUE)
```

# Contribuindo com o Projeto de Análise

1.  **Sempre** crie uma ramificação (**branch**) - A criação de branch é
    recomendada antes de mecher em qualquer arquivo do projeto

``` r
# pr_init(branch = "ajuda_grafico1")
```

2.  Agora você pode começar a fazer as contribuições nos arquivos
    desejados ou mesmo criar novos arquivos e pastas. Vamos fazer sua
    contribuição incluindo seu nome e e-mail no arquivo Readm.md
3.  Após términos das suas alterações, realize o commit e NÃO o PUSH, o
    qual deve ser feito via a função **`usethis::pr_push()`**
4.  No console, digite **`usethis::pr_push()`** e dê enter
5.  A página do Github se abrirá oara que você possa completar o
    `Pull Request (PR)`
6.  Então explique as mudanças que fez e clique em Criar Pull Request
    (Create Pull Request)
7.  Aguarde o mantenedor do projeto fazer a mesclagem (após a mesclagem
    (merge), aparecer o botão Merged (Ou Mesclado). Só então você
    finalizar sua contribuição
8.  O mantenedor pode fazer a mesclagem (merge) pelo Github ou pelo
    terminal (git pull, git merge staging, git push).
9.  No Rstudio e no projeto onde realizou a contribuição, volte para a
    branch `master` , **clique primeiro** no botão `Pull` da aba git
    para atualizar as contribuições suas e que eventualemente o
    mantenedor do repositório acrescentou ou outra pessoa.
10. Delete a branch criada usando o comando **usethis::pr_finish()**.
    Pronto você está com a versão mais atualizada.
11. Como boa prática, sempre comunique o mantenedor de suas
    modificaçãoes.

# Desfazendo uma mudança

Caso aconteça algum erro, é possível voltar a momento anterior às
modificações. Desfazer uma ação mesclada em um projeto GitHub pode ser
um pouco complicado, especialmente se a mudança já foi empurrada para o
repositório remoto. No entanto, com o **`usethis`** e o RStudio, você
pode realizar isso seguindo algumas etapas. Aqui está um guia passo a
passo para desfazer uma ação mesclada:

### **Passo 1: Identificar o commit a ser revertido**

Primeiro, você precisa identificar o hash do commit que você deseja
reverter. No RStudio, você pode visualizar o histórico de commits no
painel Git:

1.  Abra o painel Git em RStudio.

2.  Clique em “History” para ver a lista de commits.

3.  Encontre o commit que representa a mesclagem que você deseja
    desfazer e copie seu hash (um identificador alfanumérico).

### **Passo 2: Reverter o commit**

Você pode usar o pacote **`usethis`** para ajudar a gerenciar seu
repositório, mas a reversão de commits específicos é normalmente feita
usando comandos Git diretamente. Aqui estão os comandos Git que você
pode usar no terminal do RStudio:

1.  Abra o terminal no RStudio.

2.  Para reverter um commit mesclado, use o comando:

    git revert -m 1 <hash_do_commit>

    Onde **`<hash_do_commit>`** é o hash do commit de mesclagem que você
    deseja reverter. A opção **`-m 1`** indica que você está revertendo
    um commit de mesclagem e especifica o “primeiro” pai da mesclagem.

### **Passo 3: Confirmar e empurrar a reversão**

Depois de reverter o commit, você precisará confirmar (commit) a
reversão e empurrá-la para o repositório remoto:

1.  No terminal do RStudio, confirme a reversão:

    git commit -m “Revertendo o commit de mesclagem \<hash_do_commit\>”

2.  Empurre as alterações para o repositório remoto:

    git push

### **Alternativa: Reset para um estado anterior**

Se você deseja desfazer a mesclagem completamente e voltar a um estado
anterior do repositório, você pode usar o comando **`git reset`**. Este
comando deve ser usado com **cuidado**, pois pode reescrever o histórico
do repositório.

1.  Identifique o hash do commit anterior à mesclagem.

2.  No terminal do RStudio, use o comando:

    git reset –hard \<hash_do_commit_anterior\>

3.  Empurre a nova história (forçada) para o repositório remoto:

    git push –force

### **Considerações Finais**

- **Reverter um commit:** Mantém o histórico do commit original e
  adiciona um novo commit que desfaz as mudanças.

- **Resetar para um estado anterior:** Reescreve a história do
  repositório, removendo commits subsequentes.

### **Nota sobre o uso de `usethis`**

O **`usethis`** facilita várias operações comuns no Git, mas para ações
específicas como reverter commits, é melhor usar comandos Git
diretamente no terminal do RStudio. No entanto, você pode usar
**`usethis`** para preparar o ambiente, por exemplo, navegando até o
diretório do projeto:

``` r
# usethis::proj_activate("caminho/do/seu/projeto")
```

Essa abordagem garante que você esteja trabalhando no diretório correto
antes de executar comandos Git.

Com esses passos, você deve ser capaz de desfazer uma ação mesclada em
seu projeto GitHub usando RStudio e **`usethis`**.

**Mais informações neste vídeo:**

[Curso de Git e Github COMPLETO 2023 \[Iniciantes\] + Desafios + Muita
Prática](https://www.youtube.com/watch?v=kB5e-gTAl_s&t=539s)

[Curso gratuito Git e Github \#7 - Desfazendo
commit](https://www.youtube.com/watch?v=CAlg29rF2VY)  

**E nesta série Riffomonas (Code Club):**

[How to set up git for a bioinformatics project: using version control
with git and GitHub](https://www.youtube.com/watch?v=DnwEaa5QtpI)

[Integrating RStudio with a new or existing project on GitHub
(CC120)](https://www.youtube.com/watch?v=sxErFMF7BJY&list=PLmNrK_nkqBpJtNdQBPhPWjIFRYeFOGfJ1&index=10)

[Easy ways to go back in your git commit history with RStudio
(CC153)](https://www.youtube.com/watch?v=Y9h-1u6uQ6c&list=PLmNrK_nkqBpJtNdQBPhPWjIFRYeFOGfJ1&index=7)

# Anexo de criação do arquivo Readme.rmd

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
de figura resultantes para que eles sejam exibidos no GitHub. xxxxxxx
