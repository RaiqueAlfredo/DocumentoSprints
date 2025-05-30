*Passo a Passo seguido para subir o EC2 e a ServeRest em uma máquina virtual cloud*
Como Subir a máquina virtual EC2 na cloud:
    1 - Acessei o link: https://academy-compass.awsapps.com/start#/
        a - Eu já tinha a conta criada com o e-mail da compasso, onde foi usado para estudar sobre "AI e GenAI com AWS"

    2 - Cliquei em cima do meu nome e cliquei na opção "AdministratorAccess"

    3 - Na barra superior onde fica a caixa para pesquisar, fui na opção do lado da engrenagem (Configurações atuais do usuário), e nessa opção estava em "Ohio us-east-2" e mudei para "Norte da Virgínia us-east-1"

    4 - Criei uma pasta no meu diretório onde armazeno minhas anotações do estudo do dia com o nome "EC2-AWS"

    5 - Voltei ao navegador na aba "Página inicial do console" e na caixa para pesquisar coloquei "EC2" e cliquei na primeira opção que aparece "EC2 Virtual Servers in the Cloud" (Este texto aparece embaixo do EC2)

    6 - Na barra lateral que fica na esquerda, rolei pra baixo até encontrar "Rede e segurança", ao localizar, cliquei em "Pares de chaves"

    7 - No canto superior direito, cliquei na opção "Criar par de chaves"
        a - Dei o nome de "ec2 pb aws"
        b - No tipo de par de chaves, deixei na opção RSA
        c - No formato de arquivo de chave privada, coloquei na opção ".pem"
        d - Cliquei em "Criar par de chaves"
        e - Ao criar o par de chaves, vai baixar um arquivo automaticamente, então pego esse arquivo que é minha chave e coloco ele dentro da pasta com o nome "EC2-AWS" criado anteriormente

    8 - Na caixa de pesquisa, coloco "internet gateway" e clico na opção correspondente com o nome pesquisado

    9 - No canto superior direito, clico na opção "Criar gateway da Internet"
        a - No nome coloquei "ec2-serverest-gateway" e cliquei na opção "Criar gateway da Internet"

    10 - Após criar o gateway, retorna na tela anterior automaticamente e aparece uma opção em cima da tela em verde e um botão com o nome "Associar a uma VPC", cliquei nesse botão
        a - Direciona a outra tela e vai ter uma caixa para selecionar a VPC, ao clicar em cima dessa caixa, apareceu automaticamente meu vpc, selecionei ele e cliquei na opção "Associar gateway da Internet"
        b - Opcional: para conferir sua VPC, só localizar na barra lateral a opção "Suas VPCs" dentro de "Nuvem privada virtual"

    11 - Na barra lateral vou na opção "Tabelas de rotas"
        a - Seleciono a rota disponível, e na tabela inferior que abrir, vou na opção "Rotas"
        b - Clico no botão "Editar rotas", na nova tela que abrir, clico no botão "Adicionar rota"
        c - Na caixa vazia que aparece na coluna "Alvo", clico nela e coloco "Gateway da Internet" e embaixo dessa caixa, vai abrir uma nova caixa, clico nela e seleciono o id do gateway
        d - Na caixa vazia que aparece na coluna "Destino", clico nela e seleciono a primeira opção, que é "0.0.0.0/0"
        e - Clico no botão "Slavar alterações"
        f - Repito o processo acima para todas as rotas disponíveis na tabela de rotas (na rota vazia, não fiz nada)

    12 - Digito na caixa de pesquisa EC2 e acessei a opção correspondente

    13 - No lado esquerdo da página, tem um botão laranja "Executar instância", clico nele

    14 - Vai abrir a tela para iniciar uma instância
        a - No nome da instância, coloquei "Linux ServeRest"
        b - Cliquei na opção do lado do nome "Adicionar mais tags"
        c - Na opção "Tipos de recurso" do name, clico nela e deixo selecionado a caixa de "instâncias" e seleciono a caixa "volumes"
        d - Clico no botão "Adicionar nova tag", coloco o nome de "Project", no valor coloco "Programa de Bolsas" e no tipos de recursos, marco instâncias e volumes
        e - Clico no botão "Adicionar nova tag", coloco o nome de "CostCenter", no valor coloco "Quality Assurance" e no tipos de recursos, marco instâncias e volumes

    15 - Rolo a página para baixo até achar a opção de configuração "Par de chaves (login)
        a -  Na caixa para escrever nessa opção, clico nela e apareceu a minha chave criada anteriormente, então só cliquei em cima da chave para preencher

    16 - Na opção de configuração abaixo "Configurações de rede"
        a - clico para marcar as caixas "Permitir tráfego HTTPS da Internet" e "Permitir tráfego HTTP da Internet"
        b - Clico no botão "Editar" que fica do lado de "Configurações de rede"
        c - Na opção de "Atribuir IP público automaticamente" coloco em "Habilitar"
        d - Rolo para baixo até encontrar o botão "Adicionar regra de grupo de segurança"
        e - Na opção "Tipo" deixo em "TCP personalizado", no "Intervalo de portas" coloco em 3000, no "Tipo de origem" coloco em  "Qualquer lugar"

    17 - Clico no botão "Executar instância" e com isso subi minha máquina virtual na cloud

    18 - Clico no botão "Conectar-se à instância"
        a - Vou na opção "Cliente SSH"
        b - Copiei o comando para garantir que a chave não fique visível publicamente
        c - Na minha pasta onde guardei a chave baixada, abro a pasta com o git bash
        d - Colo no terminal o comando copiado
        e - Volto no navegador onde estava e clico para copiar o comando de "Exemplo:"
        f - Volto no terminal e colo o comando copiado. No terminal aparece "Are you sure you want to continue connecting (yes/no/[fingerprint])?"
        e digito "yes" e dou enter

    19 - Digito a seguinte sequência de comandos no terminal:
        a - sudo yum update -y
        b - sudo yum install gcc-c++ make -y
        c - Chequei se o "curl" tava instalado com: curl --version
        d - Como eu tinha o curl instalado, fui para o próximo comando
        e - mkdir serverestApi
        f - cd serverestApi
        g - curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - && sudo yum install -y nodejs
        h - O comando acima deu erro, então apenas continuei com o próximo comando: sudo yum install -y nodejs
        i - Executei o último comando: npx serverest@latest
            Apareceu no terminal "Ok to proceed? (y)", digitei y e dei enter

Subindo a ServeRest na máquina virtual EC2:
    20 - No terminal aparece o link para testar o funcionamento, ao acessar o link no navegador, deu erro por contar do "localhost". 
        a - Então eu volto na página que estava de "Conectar-se à instância"
        b - Vou na opção "Conexão de instância do EC2" e copio o "Endereço IPv4 público"
        c - Voltando ao link para testar o funcionamento da ServeRest
        d - Substituo o "localhost" pelo endereço IPv4 copiado e então apareceu o Swagger da ServeRest

    21 - Para testar de fato o funcionamento, copio a url que fizemos acima, vou no postman e substituo a variável url no environment da ServeRest e então vou testar as requests e vai estar funcionando.

    22 - Após terminar de testar o funcionamento
        a - No terminal dei ctrl + c para desconectar/interromper a serverest
        b - Volto no navegador na parte de "Conectar-se à instância" e na barra lateral vou em "Instâncias"
        c - Seleciono minha única instância que esta com estado de "Executando"
        d - Vou na opção de "Estado da instância" que fica do lado esquerdo de "Executar instâncias"
        e - E seleciono "Interromper instância", vai pedir para confirmar e clico em "Interromper" e com isso está interrompido

    23 - Para voltar a iniciar a istância e realizar a rotina
        a - Abro a página inicial do console da AWS vou em EC2 e na barra lateral vou em "Instâncias"
        b - Seleciono a instância "Linux ServeRest" e vou na opção "Estado da instância" e clico em "Iniciar instância"
        c - Após o estado da instância aparecer em "Executando" seleciono ela novamente e clico na opção "Conectar"
        d - Vou na opção "Cliente SSH" e copio o comando que está em "Exemplo:"
        d - Abro o terminal na pasta que está minha chave e colo o comando copiado e dou enter. E depois executo o comando: npx serverest@latest
        e - Não vai funcionar o link fornecido para testar, então voltamos na página de "Conectar-se à instância" e vou em "Conexão de instância do EC2" e copio o "Endereço IPv4 público"
        f - Então no link que aparece no terminal para testar, entro nele e troco o localhost pelo endereço copiado. 
        Então url da ServeRest vai ficar: endereçoPúblico:3000
        g - E faço o mesmo processo para testar no postman