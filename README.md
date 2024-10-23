
<!-- README.md é gerado a partir deste README.Rmd. Por favor, edite  e renderize este arquivo -->

# Tutorial de Uso do Git/Github com R e Rstudio

<!-- badges: start -->
<!-- badges: end -->

## Objetivo

O **Projeto Teste Fork** tem como objetivo fornecer orientações práticas
para usuários iniciantes e intermediários sobre como usar o Git e o
GitHub diretamente na interface do RStudio para controle de versão de
projetos. Na primeira parte, utilizamos as funções do pacote `usethis`,
e na seção “Trabalhando com Versionamento”, passamos a usar diretamente
os comandos do Git.

# Instruções Inicias para uso do Git/Github

1.  Crie uma conta gratuita no GitHub em: <https://github.com/>

2.  Baixe e instale o Git a partir do link:
    <https://git-scm.com/downloads>

3.  Instale o Git e depois abra e feche o Git Bash ao fim da instalação.
    Feche e reinicie o Rstudio para reconhecer o local de instalação do
    Git (Normalmente, fica em *C:/Program Files/Git/bin/git.exe*).

4.  Carregue o pacote `usethis` para configurar o Git para uso no
    Rstudio

``` r
library(usethis)
```

# **Configurando o Git/GitHub no RStudio**

Utilizaremos o pacote `usethis` para integrar o Git ao GitHub. Você
precisará das suas credenciais do GitHub (nome de usuário e e-mail), que
podem ser encontradas em **Configurações → Perfil Público** no GitHub.

``` r
# Configurar o Git com nome de usuário e e-mail
usethis::use_git_config(user.name = "Seu Nome", 
                        user.email = "seu.email@exemplo.com")
```

## Criando e Configurando um Token de Acesso (PAT)

1.  Para autenticar o GitHub no RStudio, você precisará criar ou
    regenerar um token de acesso pessoal (PAT). Para isso, execute o
    comando abaixo:

``` r
# Criar um token GitHub
usethis::create_github_token()
```

2.  O comando acima abrirá o site do GitHub, onde você fará login e
    gerará o token (um código de 40 dígitos). Copie esse token.
3.  Em seguida, adicione o token ao arquivo `.Renviron`, que armazena
    variáveis de ambiente no R. Isso garante que o token fique
    disponível, mas protegido.

``` r
# Abrir o arquivo .Renviron
usethis::edit_r_environ()
```

4.  No arquivo `.Renviron`, crie uma nova linha para armazenar o token:

`GITHUB_PAT=ghp_Ko3mdlNJpBzQ7lvzKTvGFg91f6HpBQlablalba`

5.  Após adicionar o token copiado do site, acrescente uma linha e salve
    o arquivo.

6.  Após configurar o token, reinicie o RStudio com o atalho:

    `CTRL + SHIFT + F10`

Esse processo configura o Git e o GitHub para uso direto no RStudio,
possibilitando versionamento eficiente e integração com o GitHub para
controle de versão de seus projetos.

# Como criar repositório

## Criando repositório primeiro no Github

A maneira mais eficiente de criar um novo repositório é diretamente pelo
site do GitHub, pois isso garante que todas as configurações sejam
corretamente definidas desde o início.

1.  Acesse sua conta no GitHub e clique no botão verde **“New”** no
    canto superior direito da página para criar um novo repositório.

2.  Defina o nome do repositório, adicione uma descrição (opcional), e
    escolha se deseja que o repositório seja público ou privado.

3.  Marque a opção **“Add a README file”** para inicializar o
    repositório com um arquivo README, que você pode editar
    posteriormente.

4.  Clique no botão **“Create repository”** para finalizar a criação.

5.  Preencha as informações conforme figura abaixo:

<img src="images/clipboard-142360520.png" width="637" />

## **Clonando o Repositório no Seu Computador**

Depois de criar o repositório no GitHub, o próximo passo é clonar o
repositório para sua máquina local, criando uma cópia que você poderá
modificar diretamente no RStudio.

1.  No GitHub, acesse a página do repositório recém-criado e clique no
    botão verde **“Code”**. Em seguida, copie a URL fornecida para
    clonar o repositório (por exemplo, algo como
    [`https://github.com/seu-usuario/seu-repositorio.git`](https://github.com/seu-usuario/seu-repositorio.git)).

<img src="images/clipboard-3984491672.png" width="314" />

2.  Agora, no RStudio, siga estes passos para criar uma cópia local do
    repositório e integrá-lo ao seu projeto:

- Vá para **File → New Project**.
- Escolha a opção **Version Control**.
- Selecione **Git**.
- Cole a URL do repositório copiada do GitHub no campo correspondente.
- Especifique a pasta onde o projeto será salvo localmente.

3.  Após esses passos, o RStudio criará uma cópia completa do seu
    repositório localmente, já vinculada ao Git e ao GitHub. Isso
    significa que você poderá gerenciar o versionamento do projeto
    diretamente, enviando e recebendo alterações entre o repositório
    local e o GitHub.

## **Implementando Pequenas Alterações no Seu Projeto de Teste**

Agora que o repositório está configurado no RStudio, você pode realizar
pequenas alterações para testar o controle de versão com Git e GitHub.

1.  **Crie pastas e arquivos:**

    - No RStudio, crie uma nova pasta e adicione um novo arquivo dentro
      dessa pasta (por exemplo, um arquivo `.R` ou `.txt`).

2.  **Comitando as alterações:**

    - Após criar a pasta e o arquivo, vá até a aba **Git** no RStudio e
      clique no botão **Commit**.

    - Selecione os arquivos que deseja versionar, adicione uma mensagem
      explicando a alteração (ex.: “Criação de pasta e arquivo de
      teste”) e clique em **Commit**.

3.  **Realizando o Push:**

    - Depois de comitar as alterações, clique em **Push** para enviar as
      modificações para o repositório remoto no GitHub.

4.  **Verificando no GitHub:**

    - Acesse seu repositório no GitHub e verifique se as mudanças (a
      nova pasta e arquivo) foram sincronizadas corretamente.

### **Alterando o `README.md` no GitHub e Realizando Pull**

1.  Acesse a página do seu repositório no GitHub.

2.  Abra o arquivo `README.md` diretamente no GitHub e faça uma
    alteração simples (ex.: adicionar uma linha com “Alteração de teste
    no GitHub”).

3.  Clique em **Commit changes** para salvar a alteração no GitHub.

Agora, volte para o RStudio:

1.  Clique na aba **Git** e, em seguida, em **Pull** para sincronizar as
    alterações do GitHub com o seu repositório local.

2.  Verifique o arquivo `README.md` no RStudio para confirmar que a
    alteração feita no GitHub foi aplicada corretamente.

### **Incluindo Pastas e Arquivos no `.gitignore`**

Nem todos os arquivos e pastas precisam ser compartilhados no
repositório. Para evitar que certos arquivos sejam versionados, você
pode listá-los no arquivo `.gitignore`.

1.  No RStudio, abra ou crie o arquivo `.gitignore` na raiz do projeto.

2.  Insira os nomes dos arquivos e pastas que não devem ser versionados.
    Por exemplo:

``` bash
# Ignorar arquivos temporários do R
*.Rhistory
*.Rdata

# Ignorar diretórios específicos
/data
/output
```

3.  Salve o arquivo e faça um commit dessas alterações. Lembre-se de
    verificar se os arquivos listados no `.gitignore` estão de fato
    sendo ignorados ao tentar comitar.

## Inclua pastas e arquivos no arquivo .gitignore

Geralmente precisamos que arquivos e pastas não sejam
compartilhados/divulgados. Para isso, insira as pastas e arquivos no
arquivo .`gitignore`. Verifique neste Projeto_Teste_Fork quais pastas e
arquivos não são compartilhados.

## Criando o Repositório no Computador

Embora o método mais recomendado seja criar o repositório diretamente no
GitHub e depois cloná-lo no seu computador, também é possível criar um
repositório localmente no seu computador e vinculá-lo ao GitHub da
seguinte maneira:

``` r
# Criar um novo projeto e repositório Git localmente
usethis::create_project(path = "D:/Git/Clube_Codigo/Nome_Projeto")

# Vincular o projeto ao Git
usethis::use_git()    

# Enviar o projeto para o GitHub e parear o repositório local
usethis::use_github()
```

Ao usar esse fluxo, o projeto será criado no caminho especificado em seu
computador, vinculado ao Git local e, posteriormente, sincronizado com o
GitHub.

### **A partir de um Projeto Existente no Computador**

Se você já possui um projeto no seu computador e deseja vinculá-lo ao
Git e ao GitHub, pode facilmente fazer isso sem criar um novo projeto do
zero.

1.  Abra o projeto existente no RStudio.

2.  Em seguida, use os comandos abaixo para vinculá-lo ao Git e
    sincronizá-lo com o GitHub:

``` r
# Vincular o projeto existente ao Git
usethis::use_git()

# Enviar o projeto para o GitHub e criar o repositório remoto
usethis::use_github()
```

Esses comandos ligarão seu projeto ao Git, permitindo controle de
versão, e o subirão para o GitHub, criando um repositório remoto pareado
com o seu projeto local.

# **Clonando e Bifurcando um Repositório (Fork)**

Ao colaborar com outras pessoas em projetos no GitHub, pode ser útil não
apenas clonar um repositório, mas também bifurcá-lo (fazer um *fork*).
Isso permite que você trabalhe em uma cópia do repositório, mantendo a
conexão com o original para futuras contribuições ou atualizações.

Para fazer isso diretamente no RStudio usando o pacote `usethis`, você
pode usar o seguinte comando:

``` r

# Clonando e bifurcando (fork) o repositório para o seu GitHub
usethis::create_from_github(
  repo_spec = "https://github.com/Evaldo-Martins-STAT/Projeto_Teste_Fork",
  destdir = "D:/Git/Clube_Codigo/",
  fork = TRUE
)
```

Neste comando:

- **`repo_spec`** especifica a URL do repositório no GitHub que você
  deseja bifurcar.
- **`destdir`** define o diretório local onde o repositório será salvo
  no seu computador.
- **`fork = TRUE`** indica que você deseja criar um *fork* do
  repositório original no seu próprio GitHub, permitindo que você
  trabalhe de forma independente no projeto.

# **Trabalhando com Versionamento no Terminal**

Após ter criado uma cópia do repositório e a ele ter sido permita
bifucação (ões) (fork), você enquanto mantenedor querer melhorar ainda
mais seus códigos dentro do projeto de análise. Siga os passos abaixo
para inserir suas alterações em arquivos editáveis como `.R`, `.Rmd`,
`.qmd`, `.csv`, `.xlsx`, ou até mesmo adicionar arquivos não editáveis
às pastas do projeto.

- Obs: as etapas descritivas abaixo são válidas quando você é
  proprietário do repositório. A partir de agora, vamos usar apenas
  terminal (bash) do RStudio para trabalhar de forma mais eficiente com
  o Git.

## **Criação de Branches e Commits**

Para listar as branches locais e verificar em qual você está
trabalhando, utilize:

``` bash
git branch
```

Agora, crie uma nova branch de nome `login1` para realizar as
alterações:

``` bash
git branch nome-da-branch
git checkout nome-da-branch
```

Agora realiza as modificações no arquivo desejado (`login.txt`). Após
realizar as modificações, adicione-as ao controle de versão e faça o
commit:

``` bash
git add .
git commit -m "Descrição das alterações"
git push --set-upstream origin nome-da-branch
```

Após executar o último comando acima, vá no repositório sua página do
Github (lembre-se, aqui você é o mantenedor) e realize uma
`Pull Request` . Você mesmo fará mesclagem (`Merge`).

## **Mesclando as Branches**

Após as modificações, é hora de mesclar a branch criada com a branch
principal (`master`):

1.  Volte para a branch `master`:

``` bash
git checkout master
```

2.  Faça um `pull` para garantir que a branch `master` está atualizada:

``` bash
git pull
```

3.  Mescle a branch criada com a `master`:

``` bash
git merge nome-da-branch
```

4.  Envie as alterações para o GitHub:

``` bash
git push
```

### **Apagando Branches**

Após a mesclagem, é possível apagar a branch local e a branch remota:

``` bash
git branch -d nome-da-branch
git push origin --delete nome-da-branch
```

# **Criando um Pull Request**

Se você não for o mantenedor do repositório, precisará criar um **Pull
Request (PR)** para solicitar a mesclagem de suas modificações com a
branch principal (geralmente `master` ou `main`). Siga os passos abaixo:

## **Passo 1: Entrar na branch `master` e sincronizar o código local**

Antes de iniciar o trabalho, você deve garantir que a branch `master` do
seu repositório local esteja atualizada com a versão mais recente do
repositório remoto.

``` bash

# Troque para a branch master
git checkout master
```

``` bash

# Faça pull para garantir que a branch master está atualizada
git pull origin master
```

## **Passo 2: Mudar para a branch onde você fez as alterações**

Agora, mude para a branch onde você fará as suas alterações.

``` bash

# Mudar para a branch onde as modificações foram realizadas
git checkout nome-da-branch
```

## **Passo 3: Fazer alterações no projeto**

Realize as alterações necessárias no projeto, como modificar arquivos,
adicionar novos arquivos ou pastas. Neste ponto, crie uma linha de
código no arquivo `request.R`. Pode ser um vetor, por exmplo.

## **Passo 4: Adicionar e comitar as alterações**

Depois de fazer as modificações, adicione os arquivos alterados ao
controle de versão e crie um commit descrevendo o que foi alterado.

``` bash

# Adicionar todas as alterações ao controle de versão
git add .
```

``` bash

# Criar um commit descrevendo as mudanças
git commit -m "Descrição clara e objetiva das alterações"
```

## **Passo 5: Enviar as alterações ao GitHub**

Agora, envie suas alterações para o repositório remoto, especificamente
para a branch em que você está trabalhando.

``` bash

# Enviar as alterações para o repositório remoto
git push origin nome-da-branch
```

## **Passo 6: Criar um Pull Request no GitHub**

1.  Acesse o seu repositório no GitHub.
2.  Clique no botão **Compare & Pull Request** que aparecerá assim que o
    push for feito com sucesso.
3.  Descreva as mudanças que você fez e por que elas são necessárias.
4.  Clique em **Create Pull Request** para submeter a solicitação de
    mesclagem ao mantenedor.

**Após a Mesclagem**

Depois que o mantenedor aprovar e mesclar suas alterações na branch
`master`, você deve seguir algumas etapas para limpar seu ambiente de
desenvolvimento local.

## **Passo 7: Mudar para a branch `master`**

Volte para a branch `master` para que você possa sincronizar as
alterações feitas no repositório.

``` bash

# Trocar para a branch master
git checkout master
```

## **Passo 8: Sincronizar as atualizações**

Agora, faça um pull para trazer as últimas alterações da branch
`master`, incluindo as suas contribuições e qualquer outra alteração que
tenha sido feita.

``` bash

# Fazer pull para obter a versão mais atualizada da master
git pull origin master
```

## **Passo 9: Deletar a branch local**

Após a mesclagem, é uma boa prática deletar a branch que você usou para
desenvolver as alterações, já que ela não será mais necessária.

``` bash

# Deletar a branch local
git branch -d nome-da-branch
```

## **Passo 10: Deletar a branch remota (opcional)**

Se a branch não será mais utilizada por ninguém, você pode também
deletá-la no repositório remoto (GitHub).

``` bash

# Deletar a branch no repositório remoto
git push origin --delete nome-da-branch
```

## **Considerações Finais**

1.  **Pull Request (PR)** é o processo mais comum para sugerir mudanças
    em um projeto colaborativo no GitHub. Ao criar um PR, você solicita
    que suas alterações sejam revisadas e integradas à branch principal.

2.  **Comunicação**: Descreva claramente o que foi alterado no PR para
    facilitar a revisão. Isso ajuda o mantenedor a entender o contexto
    das mudanças.

3.  **Boa prática**: Sempre trabalhe em branches separadas para manter a
    organização do repositório e garantir que a branch principal se
    mantenha estável.

# **Apagando a última modificação**

Caso aconteça algum erro, é possível voltar ao momento anterior às
modificações (ou até ainda a um anterior a este se os conflitos forem
grandes, mas **tenha muito cuidado em resetar commits mais antigos**).
Observamos que esta parte de reverter mudanças pode não ser tão
necessária, pois usamos poucos linhass de códigos. Mesmo assim, vamos
ver algumas funções básicas , caso precise. Primeiro vemos o histórico
de atualizações.

1.  Digite `git reflog` no terminal e veja qual o identificador do
    commit (`hash do commit`, um número alfanumérico com 8 caracteres)
    anterior a essa modificação

2.  Para resetar mudanças posteriores, digite o comando seguinte
    acompanhado do identificador anterior : `git reset --hard 7d0932f`

    **Obs:** Caso vc se arrependa dessa eliminação, você pode voltar
    atrás, fazendo um `git reflog` e digitar o numero de identificação
    da modificação que se arrependeu de apagar:
    `git reset --hard 5a6cc0a`

3.  Mas se vc quer continuar com a modificação, você precisará que o
    histórico local do seu repositório não fique atrás do histórico
    remoto. Você deve forçar que o histórico remoto seja igual ao local
    (o que pode sobrescrever alterações remotas, para isso tenha certeza
    da modificação). Você deve usar o comando  
      
    **`git push --force`**

    Obs: veja a partir do minuto 23:00 do vídeo
    `Curso de Git e Github Completo 2023` para mais esclarecimentos.

# **Considerações Finais**

- **Reverter um commit:** Mantém o histórico do commit original e
  adiciona um novo commit que desfaz as mudanças.

- **Resetar para um estado anterior:** Reescreve a história do
  repositório, removendo commits subsequentes.

- **Recomenda-se toda vez que fizer um commit, fazer `git push`**, antes
  de fazer novas alterações, para evitar a mensagem de 1 ou 2 commit a
  frente das modificações. Dá pra fazer, mas cuidado em fazer pull entre
  seu commit e seu push, pois pode gerar conflito de versões. Tudo para
  evitar trabalhar em versões não atualizadas.

- O “Pull with rebase” na aba Git, e especificamente na interface do
  RStudio, é uma operação que combina o comando **`git pull`** com a
  opção **`--rebase`**. Isso significa que, ao buscar e integrar as
  mudanças do repositório remoto, suas mudanças locais não commitadas ou
  suas novas alterações serão reaplicadas no topo do histórico do
  repositório remoto. **Isso é particularmente útil quando fazemos reset
  para um commit no passado**. Outras situações em que **devemos usar o
  Pull with rebase:**

  - **Manter um histórico de commit limpo e linear**: Ao usar rebase, o
    histórico do commit parece como se todas as mudanças fossem
    aplicadas uma após a outra, sem os commits de merge.

  - **Colaborar em um projeto com muitos colaboradores**: Um histórico
    linear facilita a compreensão do que foi alterado e por quem.

    ## Descartando alterações

**Como descartar alterações não commitadas em um arquivo e retornar ao
estado do último commit**? Siga os seguintes comandos no Terminal do
Git:

`git status`

`git checkout -- nome-do-arquivo`

`git reset HEAD nome-do-arquivo (Para remover alterações no stage)`

## Alterações não comitadas e sem ter feito uma branch

É possível **mover modificações não commitadas para uma nova branch?**

Sim. Vamos ver os passos necessários para criar uma nova branch, mover
suas alterações para essa nova branch e depois commitá-las.

- `git status`
- `git checkout -b nova-branch`
- `git status`
- `git add .`
- `git commit -m "Descrição das alterações"`
- `git push origin nova-branch`

# Mais informações

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
que há de tão especial sobre usar o `README.Rmd` em vez de apenas o
`README.md`?

Res.: Você pode incluir chunks como este:

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
