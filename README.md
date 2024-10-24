
<!-- README.md é gerado a partir deste README.Rmd. Por favor, edite  e renderize este arquivo -->

# Tutorial de Uso do Git/Github em R/RStudio

<!-- badges: start -->
<!-- badges: end -->

## Objetivo

Este Tutorial de uso do Git/Github em R/RStudio tem como objetivo
fornecer orientações práticas para usuários iniciantes e intermediários
sobre como usar o Git e o GitHub diretamente na interface do RStudio
para controle de versão de códigos em projetos em R. Na primeira parte,
utilizamos as funções do pacote `usethis`, e na seção “Trabalhando com
Versionamento”, passamos a usar diretamente os comandos do Git.

# Instruções Inicias para uso do Git/Github

1.  Crie uma conta gratuita no GitHub em: <https://github.com/>

2.  Baixe e instale o Git a partir do link:
    <https://git-scm.com/downloads>

3.  Ao fim da instalçaão do Git, abra e feche o Git Bash. Feche e
    reinicie o Rstudio para reconhecer o local de instalação do Git
    (Normalmente, fica em `C:/Program Files/Git/bin/git.exe`).

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

## Criando e Configurando um Token de Acesso Pessoal (PAT)

1.  Para autenticar o GitHub no RStudio, você precisará criar ou
    regenerar um token de acesso pessoal (PAT). Para isso, execute o
    comando abaixo:

``` r
# Criar um token GitHub
usethis::create_github_token()
```

2.  O comando acima abrirá o site do GitHub, onde você fará login e
    gerará o token (um código de 40 dígitos). Copie esse token, pois ele
    só apareceerá uma vez.
3.  Em seguida, adicione o token ao arquivo `.Renviron`, que armazena
    variáveis de ambiente no R. Isso garante que o token fique
    disponível, mas protegido.

``` r
# Abrir o arquivo .Renviron
usethis::edit_r_environ()
```

4.  No arquivo `.Renviron`, crie uma nova linha para armazenar o token,
    conforme abaixo:

`GITHUB_PAT=ghp_Ko3mdlNJpBzQ7lvzKTvGFg91f6HpBQlablalba`

5.  Após adicionar o token copiado do site, acrescente uma linha e salve
    o arquivo.

6.  Reinicie o RStudio com o atalho: `CTRL + SHIFT + F10`

Esse processo configura o Git e o GitHub para uso direto no RStudio,
possibilitando versionamento eficiente e integração com o GitHub para
controle de versão de seus projetos.

# Como criar repositório

Vamos criar nosso primeiro repositório para uso pessoal e, também,
verificar se as conexões entre o RStudio e Github via Git estão
funcionando corretamente.

## Criando repositório primeiro no Github

A maneira mais eficiente de criar um novo repositório é diretamente pelo
site do GitHub, pois isso garante que todas as configurações sejam
corretamente definidas desde o início.

1.  Acesse sua conta no GitHub e clique no botão **“New Repository”** no
    canto superior direito da página para criar um novo repositório.

    <img src="images/clipboard-1359965472.png" width="171" />

2.  Defina o nome do repositório, adicione uma descrição (opcional), e
    escolha se deseja que o repositório seja público ou privado.

3.  Marque a opção **“Add a README file”** para inicializar o
    repositório com um arquivo README, que você pode editar
    posteriormente.

4.  Preencha as informações conforme figura abaixo e clique no botão
    **“Create repository”** para finalizar a criação.

<img src="images/clipboard-142360520.png" width="637" />

## **Clonando o Repositório no Seu Computador**

Depois de criar o repositório no GitHub, o próximo passo é clonar o
repositório para sua máquina local, criando uma cópia que você poderá
modificar diretamente no RStudio. Esta etapa verifica se a comunicação
via Git está funcionando.

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

## **Implementando alterações em seu projeto**

Agora que o repositório está configurado no RStudio, você pode realizar
pequenas alterações para testar o controle de versão com Git e GitHub.
Estes procedimentos são aplicáveis quando apenas você interage com o
repositório.

1.  **Crie pastas e arquivos:**

    - No RStudio, crie uma nova pasta e adicione um novo arquivo dentro
      dessa pasta (por exemplo, uma pasta `teste` e um arquivo
      `teste.R`).

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
    alteração simples (ex.: adicionar uma linha como “Alteração de teste
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

### Inclua pastas e arquivos no arquivo .gitignore

Geralmente precisamos que arquivos e pastas não sejam
compartilhados/divulgados. Para isso, insira as pastas e arquivos no
arquivo .`gitignore`. Verifique neste Projeto_Teste_Fork quais pastas e
arquivos não são compartilhados.

## Criando o Repositório no Computador

### Criando um respositório novo no computador e ligando ao Github

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

### **Criando a partir de um Projeto Existente no Computador**

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

## **Clonando e Bifurcando um Repositório (Fork)**

Ao colaborar com outras pessoas em projetos no GitHub, pode ser útil não
apenas clonar um repositório, mas também bifurcá-lo (fazer um *fork*).
Isso permite que você trabalhe em uma cópia do repositório, mantendo a
conexão com o original para futuras contribuições ou atualizações.

Para fazer isso diretamente no RStudio de maneira eficiente, use o
pacote `usethis`, e o copie, cole em um script R e execute o seguinte
comando:

``` r

# Clonando e bifurcando (fork) o repositório para o seu GitHub
usethis::create_from_github(
  repo_spec = "https://github.com/Evaldo-Martins-STAT/Projeto_Teste_Fork",
  destdir = "D:/Git/Clube_Codigo/",
  fork = TRUE
)
```

Neste comando, temos:

- **`repo_spec`** especifica a URL do repositório no GitHub que você
  deseja bifurcar.
- **`destdir`** define o diretório local onde o repositório será salvo
  no seu computador.
- **`fork = TRUE`** indica que você deseja criar um *fork* do
  repositório original no seu próprio GitHub, permitindo que você
  trabalhe de forma independente no projeto.

# **Trabalhando com Versionamento no Terminal**

Após ter criado uma cópia do repositório e a ele ter sido permitida
bifucação (ões) (fork), você, enquanto mantenedor, pode querer melhorar
ainda mais seus códigos dentro do projeto de análise. Siga os passos
abaixo para inserir suas alterações em arquivos editáveis como `.R`,
`.Rmd`, `.qmd`, `.csv`, `.xlsx`, ou até mesmo adicionar arquivos não
editáveis às pastas do projeto.

- Obs: as etapas descritivas abaixo são válidas quando você é
  proprietário do repositório. A partir de agora, vamos usar apenas
  terminal (bash) do RStudio para trabalhar de forma mais eficiente com
  o Git.

## Versionando enquanto mantenedor

Antes de começar, atualize a sua branch master local:

``` bash
git checkout master
git pull
```

### **Criação de Branches e Commits**

Para listar as branches locais e verificar em qual você está
trabalhando, utilize:

``` bash
git branch
```

Agora, crie uma nova branch de nome `login1` para realizar as
alterações:

``` bash
git checkout -b nome-da-branch
```

**Realização de Mudanças** **no Projeto:**

Agora faça as modificações no arquivo desejado (`login.txt`). Inclua o
campo: `digite nome pet.` Após realizar as modificações, adicione-as ao
controle de versão e faça o commit:

``` bash
git add .
```

``` bash
git commit -m "Descrição das alterações"
```

``` bash
git push --set-upstream origin nome-da-branch
```

Após executar o último comando acima, vá no repositório sua página do
Github (lembre-se, aqui você é o mantenedor) e realize uma
`Pull Request` . Você mesmo fará mesclagem (`Merge`).

### **Mesclando as Branches no computador**

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
```

``` bash
git push origin --delete nome-da-branch
```

## **Versionando enquanto colaborador - Criando uma Pull Request**

Se você não for o mantenedor do repositório, precisará criar um **Pull
Request (PR)** para solicitar a mesclagem de suas modificações com a
branch principal (geralmente `master` ou `main`). Siga os passos abaixo:

### **Passo 1: Entrar na branch `master` e sincronizar o código local**

Antes de iniciar o trabalho, você deve garantir que a branch `master` do
seu repositório local esteja atualizada com a versão mais recente do
repositório remoto.

``` bash
git checkout master
```

Faça pull para garantir que a branch master está atualizada:

``` bash
git pull origin master
```

### **Passo 2:** Criar ou atualizar a branch de trabalho

- **Se for uma nova branch**:

Se você **ainda não criou** a branch onde fará as alterações:

``` bash
git checkout -b nome-da-branch
```

- **Se a branch já existir**:

Se você **já tem** a branch e ela foi criada anteriormente, faça um
merge ou rebase.

``` bash
git checkout nome-da-branch
```

``` bash
git merge master
```

Ou se preferir o rebase:

``` bash
git rebase master
```

- **Explicação do merge e rebase:** Se você já vinha trabalhando em uma
  branch, é crucial incorporar as últimas alterações da `master` nela.
  Isso pode ser feito via `git merge master` ou `git rebase master`. O
  `merge` cria um novo commit de mesclagem, enquanto o `rebase` reaplica
  seus commits sobre as mudanças da `master`.
- **Atenção**: no momento de fazer Pull Request nko Github, você deve ir
  na branch do Github correspondente àquela que ainda está usando a fim
  de poder visualizar o botão de solicitação da Pull Request.

### **Passo 3: Fazer alterações no projeto**

Realize as alterações necessárias no projeto, como modificar arquivos,
adicionar novos arquivos ou pastas. Neste ponto, crie uma linha de
código no arquivo `request.R`. Pode ser um vetor, por exmplo.

### **Passo 4: Adicionar e comitar as alterações**

Depois de fazer as modificações, adicione os arquivos alterados ao
controle de versão e crie um commit descrevendo o que foi alterado.

``` bash
git add .
```

Criar um commit descrevendo as mudanças:

``` bash
git commit -m "Descrição clara e objetiva das alterações"
```

### **Passo 5: Enviar as alterações ao GitHub**

Agora, envie suas alterações para o repositório remoto, especificamente
para a branch em que você está trabalhando.

``` bash
git push origin nome-da-branch
```

### **Passo 6: Criar um Pull Request no GitHub**

1.  Acesse o seu repositório no GitHub (Pode ser preciso mudar de branch
    para acessar o botão da Pull Request)
2.  Clique no botão **Compare & Pull Request** que aparecerá assim que o
    push for feito com sucesso.
3.  Descreva as mudanças que você fez e por que elas são necessárias.
4.  Clique em **Create Pull Request** para submeter a solicitação de
    mesclagem ao mantenedor.

**Após a Mesclagem**

Depois que o mantenedor aprovar e mesclar suas alterações na branch
`master`, você deve seguir algumas etapas para limpar seu ambiente de
desenvolvimento local.

### **Passo 7: Mudar para a branch `master`**

Volte para a branch `master` para que você possa sincronizar as
alterações feitas no repositório.

``` bash
git checkout master
```

### **Passo 8: Sincronizar as atualizações**

Agora, faça um pull para trazer as últimas alterações da branch
`master`, incluindo as suas contribuições e qualquer outra alteração que
tenha sido feita.

``` bash
git pull
```

### **Passo 9: Deletar a branch local**

Após a mesclagem, é uma boa prática deletar a branch que você usou para
desenvolver as alterações, já que ela não será mais necessária.

``` bash
git branch -d nome-da-branch
```

### **Passo 10: Deletar a branch remota (opcional)**

Se a branch não será mais utilizada por ninguém, você pode também
deletá-la no repositório remoto (GitHub).

``` bash
git push origin --delete nome-da-branch
```

### **Considerações Finais**

1.  **Pull Request (PR)** é o processo mais comum para sugerir mudanças
    em um projeto colaborativo no GitHub. Ao criar um PR, você solicita
    que suas alterações sejam revisadas e integradas à branch principal.

2.  **Comunicação**: Descreva claramente o que foi alterado no PR para
    facilitar a revisão. Isso ajuda o mantenedor a entender o contexto
    das mudanças.

3.  **Boa prática**: Sempre trabalhe em branches separadas para manter a
    organização do repositório e garantir que a branch principal se
    mantenha estável.

## **Apagando a Última Modificação caso haja erro**

Se ocorrer algum erro, é possível voltar ao estado anterior à
modificação. Você pode até reverter para um estado anterior mais
distante, mas é importante ter cuidado ao resetar commits mais antigos,
pois isso pode impactar o histórico do projeto. Mesmo que isso não seja
sempre necessário, é útil saber como proceder caso precise corrigir
algo.

### **Passo 1: Visualizar** Histórico de Commits

Primeiro, você precisa verificar o histórico de commits e identificar o
ponto para o qual deseja reverter o projeto. Para isso, use o comando:

``` bash
git reflog
```

Esse comando exibirá uma lista com o histórico de commits e seus
identificadores (hashes), que são códigos alfanuméricos de 8 caracteres.
Identifique o commit anterior ao erro que você deseja corrigir.

### **Passo 2: Resetar para um Commit Anterior**

Para voltar a um commit anterior, execute o seguinte comando,
substituindo o identificador do commit pelo hash correspondente:

``` bash
git reset --hard 7d0932f
```

Esse comando redefine o repositório local para o estado do commit
especificado, desfazendo qualquer alteração feita após ele. **Cuidado:**
isso removerá qualquer mudança não comitada.

### **Passo 3: Revertendo o Reset (Opcional)**

Se você mudar de ideia e quiser restaurar o commit que acabou de
resetar, pode voltar atrás executando novamente o comando `git reflog` e
usando o identificador do commit que deseja recuperar:

``` bash
git reset --hard 5a6cc0a
```

### **Passo 4: Sincronizar com o Repositório Remoto**

Após fazer um reset local, é importante garantir que o repositório
remoto também esteja atualizado. Se o repositório remoto tiver commits
que você reverteu no local, será necessário forçar a atualização para
alinhar ambos os históricos. Isso pode sobrescrever as alterações no
servidor remoto, então tenha certeza das suas mudanças.

Para forçar o push das alterações locais para o repositório remoto,
utilize:

``` bash
git push --force
```

Esse comando força a sobrescrição do histórico remoto com o histórico
local.

### **Considerações Importantes:**

1.  **Usar `git reset --hard` com cautela**: Esse comando remove
    permanentemente as alterações que não foram comitadas e pode alterar
    o histórico de commits.

2.  **Reverta apenas se necessário**: Antes de usar o `--force` para
    sobrescrever o repositório remoto, certifique-se de que isso não
    afetará o trabalho de outros colaboradores.

3.  **Alternativa com `git revert`**: Em vez de usar `reset --hard`,
    você pode usar `git revert` para desfazer alterações sem alterar o
    histórico. Isso cria um novo commit que desfaz as mudanças, mantendo
    a integridade do histórico de commits.

Obs: veja a partir do minuto 23:00 do vídeo
`Curso de Git e Github Completo 2023` para mais esclarecimentos.

## Descartando Alterações Não Commitadas em um Arquivo

Se você fez alterações em um arquivo, mas ainda não fez o commit e
deseja descartar essas modificações, retornando o arquivo ao estado do
último commit, siga os passos abaixo usando o Terminal do Git:

### Passo 1: Verificar o Status do Repositório

Antes de qualquer ação, é importante verificar o estado atual do
repositório e ver quais arquivos foram modificados ou estão prontos para
commit.

``` bash
git status
```

Esse comando listará os arquivos que foram modificados e se estão ou não
no *staging area* (prontos para serem commitados).

### **Passo 2: Descartar as Alterações em um Arquivo Específico**

Se você deseja descartar todas as modificações feitas em um arquivo
específico e restaurá-lo ao estado do último commit, use o seguinte
comando:

``` bash
git checkout -- nome-do-arquivo
```

Esse comando descarta as alterações locais não commitadas no arquivo
especificado, retornando-o ao estado do último commit.

### **Passo 3: Remover Arquivos do Stage (Caso Estejam Preparados para Commit)**

Se o arquivo já foi adicionado ao *staging area* (ou seja, preparado
para commit com `git add`), mas você quer removê-lo dessa área sem
descartar suas alterações, use o comando abaixo:

``` bash
git reset HEAD nome-do-arquivo
```

Esse comando remove o arquivo do *staging area* e desfaz o `git add`,
mas mantém as alterações feitas no arquivo. Isso é útil quando você quer
revisar ou modificar mais antes de commitá-lo.

## Movendo Alterações Não Commitadas para uma Nova Branch

Se você fez alterações em arquivos, mas ainda não as comitou, e percebeu
que deveria estar trabalhando em uma nova branch, não se preocupe. É
possível criar uma nova branch e mover suas alterações para ela, sem
perder nada. Veja como proceder:

### **Passo 1: Verificar o Status do Repositório**

Antes de qualquer ação, verifique o status do repositório para confirmar
as modificações não commitadas e garantir que você está na branch
correta:

``` bash
git status
```

Isso exibirá os arquivos modificados e não commitados no seu
repositório.

### **Passo 2: Criar uma Nova Branch e Mudar para Ela**

Agora, crie uma nova branch e mude para ela, preservando suas
alterações:

``` bash
git checkout -b nova-branch
```

Esse comando cria a nova branch chamada `nova-branch` e automaticamente
muda para ela, carregando consigo todas as suas alterações não
commitadas da branch anterior.

### **Passo 3: Verificar o Status da Nova Branch**

Após criar e mudar para a nova branch, verifique novamente o status para
confirmar que as alterações ainda estão no estado de não commitadas:

``` bash
git status
```

### **Passo 4: Adicionar as Alterações ao Staging Area**

Agora que você está na nova branch, adicione as alterações ao *staging
area* para prepará-las para commit:

``` bash
git add .
```

O ponto final (`.`) indica que todas as modificações devem ser
adicionadas ao *staging*.

### **Passo 5: Realizar o Commit das Alterações**

Em seguida, faça o commit das suas alterações com uma mensagem
descritiva:

``` bash
git commit -m "Descrição das alterações"
```

### **Passos 6-10: Faça os passos seguintes conforme seja mantenedor ou colaborador**

Faça os paços seguintes, como enviar (push), fazer pull request, etc,
conforme seja colaborador ou mantenedor (veja respectivas seções acima).

# **Boas Práticas Gerais**

1.  **Commits Pequenos e Frequentes**: Realize commits de maneira
    frequente e com descrições claras. Isso facilita a revisão do código
    e ajuda a identificar pontos de erro rapidamente.

2.  **Sincronize Regularmente**: Faça `git pull` regularmente antes de
    começar a trabalhar para garantir que você está com a versão mais
    recente do projeto. Isso evita conflitos e confusões.

3.  **Use Branches**: Sempre crie uma nova branch para implementar
    mudanças específicas, mantendo a branch `master` ou `main` estável.

4.  **Revisão de Código (Pull Requests)**: Utilize Pull Requests para
    revisar as alterações de forma colaborativa antes de mesclá-las à
    branch principal. Isso melhora a qualidade do código e reduz o risco
    de bugs.

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

Recomendamos sempre criar um bom arquivo Reame para descrever bem seu
repositório. Para criar o Readme.rmd usei a função
`usethis::use_readme_rmd()` . O que há de tão especial sobre usar o
`README.Rmd` em vez de apenas o `README.md`?

Resposta.: Você pode incluir tabelas e gráficos usando chunks de
códigos, tal como este que inclui uma tabela de resumo de dados:

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
de figura resultantes para que eles sejam exibidos no GitHub. Nesta
etapa de versionamento, utilize uma das duas opções acima caso seja
proprietário ou apenas colaborador.
