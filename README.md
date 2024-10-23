
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

# **Contribuindo com um Projeto de Análise**

## **Passo a Passo para Fazer Modificações**

Após ter criado uma cópia do repositório (fork) a partir do GitHub
remoto, você pode querer melhorar o código desse projeto de análise.
Siga os passos abaixo para inserir suas alterações em arquivos editáveis
como `.R`, `.Rmd`, `.qmd`, `.csv`, `.xlsx`, ou até mesmo adicionar
arquivos não editáveis às pastas do projeto.

### **1. Criando uma Ramificação (Branch)**

Antes de alterar qualquer arquivo, crie uma nova branch (ramificação). A
criação de uma branch é recomendada para isolar suas modificações do
código principal. Primeiro, certifique-se de estar na branch principal
(master) e crie uma nova branch para suas alterações:

``` bash
git branch nome-da-branch
git checkout nome-da-branch
```

Dê um nome apropriado à branch que reflita as mudanças que você deseja
implementar.

### **2. Fazendo as Alterações**

Faça as modificações nos arquivos que deseja alterar ou crie novos
arquivos e pastas. Como exemplo, faça pequenas alterações no arquivo
`Readme.Rmd`, como adicionar seu nome e e-mail à tabela de
colaboradores. Depois, renderize o arquivo clicando em **Knit**, o que
também atualizará o `Readme.md`.

**Cadastre seu nome e endereço de e-mail abaixo:**

| \#  |              Nome              |          e-mail           |
|:---:|:------------------------------:|:-------------------------:|
|  1  |    Evaldo Martins da Silva     |   evaldomartins@ufpa.br   |
|  2  | Rayane Leticia Furtado Pinheio | rayanefurtado63@gmail.com |
|  3  | Carlos Thayan Moreira Ferreira | thayanmoreira1@gmail.com  |
|  4  |          Elton Correa          |    eltonpesc@gmail.com    |
|  5  |          Texto Rayane          |                           |
|  6  |          Teste thayan          |                           |
|  7  |          Texto Evaldo          |                           |

Lista de Colaboradores do Projeto (Repositório).

### **3. Realizando o Commit e Push**

Após concluir as alterações, siga os procedimentos abaixo para enviar
suas mudanças ao GitHub:

``` bash

git add .
git commit -m "Descrição das alterações"
git push --set-upstream origin nome-da-branch
```

### **4. Criando um Pull Request (PR)**

Depois do push, acesse o GitHub, onde será exibida uma opção para criar
um Pull Request. Descreva suas mudanças e clique em **Create Pull
Request**. Aguarde o mantenedor do projeto revisar e mesclar suas
alterações.

### **5. Atualizando e Deletando a Branch**

Após a mesclagem, retorne à branch `master` no RStudio e execute um
`pull` para atualizar sua cópia local com as alterações feitas pelo
mantenedor:

``` bash
git checkout master
git pull
```

Agora, você pode excluir a branch local e remota:

``` bash
git branch -d nome-da-branch
git push origin --delete nome-da-branch
```

## **Trabalhando com Versionamento no Terminal**

Esta etapa é valida caso você seja proprietário do repositório. Vamos
utilizar o terminal do RStudio para trabalhar de forma mais profissional
com o Git.

### **Verificando o Histórico de Atualizações**

Certifique-se de que você está no diretório correto:

``` r
getwd()
```

Agora, visualize o histórico de commits:

``` bash
git reflog
```

### **Criação de Branches e Commits**

Para listar as branches locais e verificar em qual você está
trabalhando, utilize:

``` bash
git branch
```

Agora, crie uma nova branch para realizar as alterações:

``` bash
git branch nome-da-branch
git checkout nome-da-branch
```

Após realizar as modificações, adicione-as ao controle de versão e faça
o commit:

``` bash
git add .
git commit -m "Descrição das alterações"
git push --set-upstream origin nome-da-branch
```

### **Mesclando as Branches**

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

Se você não for o mantenedor, deve fazer um Pull Request para solicitar
a mesclagem de suas mudanças com a branch principal do projeto. Execute
os seguintes passos:

1.  Entre na branch `master`, faça um `pull` e depois mude para a branch
    que você deseja solicitar o Pull Request:

``` bash
git checkout master
git pull
git checkout nome-da-branch
```

2.  Faça suas alterações, adicione e comite as modificações:

``` bash
git add .
git commit -m "Descrição das alterações"
```

3.  Envie suas alterações ao GitHub e crie um Pull Request:

``` bash
git push
```

4.  No GitHub, clique em **Compare & Pull Request**, descreva suas
    mudanças e clique em **Create Pull Request**.
5.  Após a mesclagem, passe as seguinte etpas:

- Mude para a master
- Faça pull
- Delete a branch no computador
- Delee a branch no Github

## **Trabalhando com versionamento no Terminal**

De agora em diante, vamos trabalhar via Terminal do RStudio a fim de
trabalhar de forma mais profissional com o versionamento de códigos.

### **Verificando o histórico de atualizações**

Certifique-se de que você está no diretório do projeto, digitando
`getwd()` no console. Agora vamos ver o histórico de comando. Digite no
terminal:

`git reflog`

A aparecerá uma lista de todos os commits (versionamentos) que você já
fez no projeto e de seus colaboradores. Vamos agora executar as etapas
listadas acima

### **Criação de Branches e Commits**

- Antes de criar a branch para começar as modificações, verifica as suas
  branches locais como o comando

`git branch`

Aparecerão as branches e a branch atual, que será destacada em verde.

- Vamos agora criar uma nova branch em que trabalharemos no arquivo
  Readme.Rmd para aprendermos a usar essas funcionalidades do git.
  Chamaremos essa branch de “leia-me”.

`git branch leia-me`

Verifique se ela foi criado com o comando abaixo ou na aba Git do
Rstudio

`git branch`

- É preciso mude agora para a branch em que deseja trabalhar. Digite os
  seguintes comando:

`git checkout leia-me`

`git branch`

### Realizando alterações

Vamos agora fazer umas alterações pequenas no arquivo Readme.Rmd e
salve-o (Renderize que você já vai salvar), e depois feche-o.

**Cadastre seu nome e endereço de e-mail abaixo:**

| \#  |              Nome              |          e-mail           |
|:---:|:------------------------------:|:-------------------------:|
|  1  |    Evaldo Martins da Silva     |   evaldomartins@ufpa.br   |
|  2  | Rayane Leticia Furtado Pinheio | rayanefurtado63@gmail.com |
|  3  | Carlos Thayan Moreira Ferreira | thayanmoreira1@gmail.com  |
|  4  |          Elton Correa          |    eltonpesc@gmail.com    |
|  5  |          Texto Rayane          |                           |
|  6  |          Teste thayan          |                           |
|  7  |          Texto Evaldo          |                           |

Lista de Colaboradores do Projeto (Repositório).

- Digite o seguinte comando abaixo para identificar qualquer modificação
  nos arquivos:

`git status`

- Adicione a modificação. Mas lembre que a modificaçõa ainda não foi
  para a branch master

`git add .`

`git status`

### Fazendo o commit e push das modificações

- Vamos fazer o commit dessa alteração (versionamento)

`git commit -m "Adicionando nome e e-mail"`

- Estando tudo certo até agora, faça o `git push` para enviar ao Github

`git push`

Ele dá uma mensagem de erro quando criamos uma branch nova. Copie a
sugestão de comando e execute novamente.

`git push --set-upstream origin leia-me`

- Verifique agora no Github as duas versões do arquivo de texto em cada
  uma das branches, ou seja, `leia-me` e `master`.

### Realizando a mesclagem

- É preciso, então, realizar a MESCLAGEM da `leia-me` para a `master`.
  Se vc for o mantendedor do projeto, volte ao terminal do RStudio e
  digite:

`git branch`

Agora vamos unir o código. Você vai entrar na branch que vai receber as
atualizações, no caso a branch master com os seguintes comandos:

`git checkout master`

`git branch`

Agora podemos mesclar da `leia-me` para a `master`.

**Obs**: Antes de fazer a mesclagem, recomenda-se puxar (pull) as
atualizaçãoes que estão no servidor para a sua máquina, pois pode ser
que algum outro colega fez atualizações (é preciso não mexer na mesma
parte de funcionalidade do código que você) e você pode correr o risco
de estar fazendo mesclagem com uma versão antiga. Digite os comandos
abaixo:

`git pull`

`git merge leia-me`

- Faça agora o git push para enviar ao Github remoto

`git push`

Agora vá na branch master do Github remoto e verifique se o código foi
atualizado na master. Só adicione os códigos que foram testados e estão
funcionando corretamente.

### Apague as branches locais e remota

- Finalmente, `apague a branch local e remota.` Mude para outra branch,
  como a master e apague a branch local

  `git checkout master`

  `git branch -d nome-da-branch`

- Se quiser forçar a exclusão de uma branch se ela ainda não foi
  mesclada, use:

  - `git branch -D nome-da-branch`

- Para apagar a branch no repositório remoto, você precisa usar o
  seguinte comando

  `git push origin --delete nome-da-branch`

**Obs: Caso não seja o mantenedor do projeto,** veja como se faz o
processo de alterar/comitar/empurrar/mesclar/apagar branch em *Criando
uma Pull Request* usando o terminal.

## **Mais um exercício de aplicação**

Vamos criar mais uma linha no arquivo de texto (ou outra funcionalidade
qualquer no projeto)

1.  Faça a atualização: `git pull` na master

2.  Crie a sua branch e mude para ela:
    `git checkout -b sistema-de-login master`

3.  Crie um novo arquivo txt chamado
    `sistema de login.txt (ou login2.txt)` e salve-o.

4.  Digite `git add . && git status` e o arquivo ficará pronto para ser
    adicionado

5.  Confirme essas alterações: `git commit -m "Criado sistema de Login"`

6.  Digamos que tudo esteja funcionando e checado o código remotamente,
    volte para a master:

    `git checkout master && git branch`

7.  Atualize o código da master: `git pull`

8.  Agora sim, você pode mesclar: `git merge sistema-de-login master`

9.  Mande essa alteração para o servidor: `git push`

10. Observe no servidor do github as alterações

11. Apague a branch:
    `git checkout master && git branch -d nome-da-branch`

12. Apague a branch remotamente:
    `git push origin --delete nome-da-branch`

# **Criando um Pull Request**

Em alguns casos, só vamos conseguir unir códigos se fizermos uma
requisição para uma pessoa responsável pelo repositório através do
processo chamado Pull request. Vamos imaginar que você queira fazer
alterações via a branch sistema-de-login.

1.  Vamos entrar na nossa master `(git checkout master)`, fazer
    `git pull` e depois mudar para a branch sistema-de-login:
    `git checkout sistema-de-login`

2.  Altere o arquivo `login.txt` acrescentando a linha: “Digite sua
    idade**“** e salve o arquivo.

3.  Adicione : `git add . && git status`

4.  Agora faça commit:
    `git commit -m "Adicionado idade ao sistema de login"`

5.  Agora, seu código precisa ser mesclado por outra pessoa da equipe.
    Você faz um push e não mescla nada como feito acima. Digite de
    dentro da branch modificada: `git push`

6.  O Sitema vai pedir que digite um novo comando:
    `git push --set-upstream origin sistema-de-login`

7.  Veja na página no Github e observará que aparece a branch
    sistema-de-login atualizada recentemente e que pede para comparar e
    fazer Pull Request. Clique em `Compare & Pull Request`

8.  O sistema muda para a janela indicando que a solicitação de
    mesclagem vai da branch sistema-de-login para a master

9.  Você pode explicar mais em comentários ao mantenedor sobre sua
    contribuição e clique em `Create Pull Request`

10. A pessoa que tiver o poder para fazer a revisão e mesclar, pode
    clicar em `Merge Pull Request`

11. Vá para master e faça um git pull para obter as modificações
    mescladas

12. Apague a branch: veja acima como apagar um branch pelo terminal.

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
