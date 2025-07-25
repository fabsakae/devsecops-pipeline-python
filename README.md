### DevSecOps Pipeline com Python 

Este projeto demonstra uma pipeline CI/CD moderna com práticas de **versionamento**, **integração contínua**, **entrega contínua** e **segurança automatizada**, usando:

- Python (aplicação base)
- Docker
- GitHub Actions
- Kubernetes
- ArgoCD
- AWS (em breve)
- Ferramentas DevSecOps

## Estrutura

```bash
├── .github/workflows/   # Pipeline CI
├── app/                 # Aplicação em Python
├── k8s/                 # Manifests para Kubernetes
├── Dockerfile           # Imagem da aplicação
├── requirements.txt     # Dependências da aplicação
└── README.md            # Este arquivo
```
## Objetivos

* Automatizar build e deploy com GitHub Actions
* Usar ferramentas de análise de segurança (SAST/DAST)
* Empacotar a aplicação em container Docker
* Publicar em Kubernetes com ArgoCD
* Implantar boas práticas de DevSecOps

# Etapa 1 – Pipeline DevSecOps Completo
Objetivo: Demonstrar integração contínua, deploy contínuo e segurança em tempo de build/deploy. 

Parte 1: Parte 1: Criar estrutura do projeto no ambiente local

devsecops-pipeline-python/ 
├── app/ 
│   └── app.py 
├── Dockerfile 
├── requirements.txt 
├── .github/ 
│   └── workflows/ 
│       └── ci.yml 
├── k8s/ 
│   ├── deployment.yaml 
│   └── service.yaml 
└── README.md 

* Código fonte (app/app.py) 
* Arquivo Docker para containerização 
* Arquivo de dependências Python (requirements.txt) 
* Estrutura de CI/CD (.github/workflows/ci.yml) 
* Manifestos para deploy em Kubernetes (k8s/*.yaml) 
* Documentação (README.md) 

Parte 2: Criar o conteúdo do `app.py`
Aplicação feita com Flask + Python para testar a pipeline.

Testar aplicação Flask localmente (no WSL).
1. Criar ambiente virtual	
```bash
python3 -m venv venv
```
2. Ativar ambiente	
```bash
source venv/bin/activate
```
3. Instalar as dependências do projeto
```bash
pip install -r requirements.txt
```
4. Instalar Flask	
```bash
pip install flask
```
5. Registrar dependência	
```bash
pip freeze > requirements.txt
```
6. Rodar a aplicação
```bash
python3 app/app.py
```

7. Teste no browser	Acessar http://localhost:5000


