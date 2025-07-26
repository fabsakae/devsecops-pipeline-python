# FROM: Define a imagem base a partir da qual sua imagem será construída.
# Usamos 'python:3.10-slim-buster' que é uma imagem oficial do Python,
# menor ('slim') e baseada no Debian 'buster', ideal para produção
# por ser mais leve e ter menos superfícies de ataque.
FROM python:3.10-slim-buster

# WORKDIR: Define o diretório de trabalho padrão dentro do contêiner.
# Todos os comandos de shell (RUN, CMD) e cópia (COPY) subsequentes
# serão executados a partir deste diretório (ou relativos a ele).
WORKDIR /app

# COPY requirements.txt .: Copia o arquivo 'requirements.txt' do seu
# sistema local (onde você está rodando o 'docker build') para o
# diretório de trabalho ('/app') dentro do contêiner.
# Fazemos isso primeiro para aproveitar o cache do Docker: se suas dependências
# não mudarem, esta camada não precisa ser reconstruída, acelerando futuras builds.
COPY requirements.txt .

# RUN: Executa um comando dentro do contêiner durante o processo de build.
# pip install --no-cache-dir --upgrade pip: Garante que o pip esteja atualizado
# e instala as dependências do 'requirements.txt' sem armazenar cache,
# o que ajuda a manter o tamanho final da imagem menor.
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# COPY app/ .: Copia o conteúdo da pasta 'app/' do seu sistema local
# para o diretório de trabalho ('/app') dentro do contêiner.
# Isso significa que seu 'app.py' estará em '/app/app.py' dentro do contêiner.
COPY app/ app/

# EXPOSE: Informa ao Docker que o contêiner ouvirá na porta 5000 em tempo de execução.
# Isso é apenas uma documentação; não publica a porta no host automaticamente.
EXPOSE 5000

# ENV FLASK_APP=app/app.py: Define uma variável de ambiente dentro do contêiner.
# O Flask usa a variável FLASK_APP para saber qual arquivo principal ele deve carregar
# quando você usa o comando 'flask run'. O caminho 'app/app.py' é porque copiamos
# a pasta 'app' para dentro da pasta '/app' no contêiner.
ENV FLASK_APP=app/app.py

# CMD: Define o comando padrão que será executado quando o contêiner for iniciado.
# Usamos 'flask run' que é o comando idiomático do Flask.
# --host=0.0.0.0: Faz com que a aplicação Flask seja acessível de qualquer interface de rede
#                   dentro do contêiner, o que é crucial para acessá-la de fora.
# --port=5000: Define a porta na qual o Flask irá escutar.
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
