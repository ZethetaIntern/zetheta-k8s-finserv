# 💳 zetheta-k8s-finserv

A production-ready, security-hardened Kubernetes project for a Financial Services (FinServ) application. This project demonstrates modern DevOps practices including containerization, Kubernetes orchestration, secret management, and security-focused deployment.

## 🚀 Features

- Kubernetes-based microservice deployment
- Security-hardened production architecture
- HashiCorp Vault for secrets management
- RBAC & Network Policies
- Docker containerized services
- Infrastructure as Code using YAML

## 🛠 Tech Stack

- Kubernetes
- Docker
- HashiCorp Vault
- Linux & Shell
- YAML

## 📁 Project Structure

```text
zetheta-k8s-finserv/
├── frontend/
├── backend/
├── database/
├── kubernetes/
├── vault/
└── scripts/
```

## ⚙️ Deployment

```bash
# Create namespace
kubectl apply -f kubernetes/namespace.yaml

# Deploy application
kubectl apply -f kubernetes/

# Check resources
kubectl get pods -A
kubectl get svc -A
```

## 🔐 Security

- Secret management with Vault
- RBAC for access control
- Network Policies for pod isolation
- TLS-ready deployment
- PCI-DSS inspired security practices

## 📚 Learning Outcomes

- Kubernetes deployment
- DevOps workflow
- Secrets management
- Infrastructure automation
- Production-ready architecture

## 👨‍💻 Author

**Mayank Rawal**

GitHub: https://github.com/mayankrawall


# FinServ Digital - Hardened Kubernetes Platform

Production-grade Kubernetes platform for 20 financial microservices satisfying RBI regulations and PCI-DSS Level 1 audit standards.

## Key Highlights
- Zero-trust default-deny network segmentation
- Enforced Pod Security Standards (Restricted)
- Dynamic secrets management via HashiCorp Vault
- Runtime anomaly detection with Falco
