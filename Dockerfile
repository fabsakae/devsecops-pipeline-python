# Use uma imagem base Python oficial.
# python:3.10-slim-buster é uma boa escolha para ambientes de produção,
# pois é menor que as imagens completas de Python e tem base Debian (buster).
FROM python:3.10-slim-buster

# Define o diretório de trabalho dentro do contêiner.
# Todos os comandos subsequentes (COPY, RUN, CMD) serão executados neste diretório.
WORKDIR /app

# Copia o arquivo requirements.txt para o diretório de trabalho.
# Isso permite que o pip instale as dependências antes de copiar todo o código da aplicação,
# otimizando o cache do Docker (se o requirements.txt não mudar, esta camada não é reconstruída).
COPY requirements.txt .

# Instala as dependências Python especificadas no requirements.txt.
# O --no-cache-dir é para evitar que o pip armazene pacotes em cache, reduzindo o tamanho final da imagem.
# O --upgrade pip garante que o pip esteja atualizado.
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copia todo o código da sua aplicação (a pasta 'app') para o diretório de trabalho no contêiner.
# Isso significa que o seu main.py estará em /app/main.py (porque a pasta 'app' do host foi copiada para o WORKDIR /app).
COPY app/ .

# Expõe a porta que a aplicação Flask vai escutar.
EXPOSE 5000

# Define a variável de ambiente FLASK_APP para apontar para o seu arquivo principal.
ENV FLASK_APP=app.py

# Define o comando que será executado quando o contêiner for iniciado.
# Usa o comando 'flask run' que é mais idiomático.
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
