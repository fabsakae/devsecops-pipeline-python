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
.
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
