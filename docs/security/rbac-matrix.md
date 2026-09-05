# RBAC Access Control Matrix

| Persona | Namespace Scope | Pods/Services | Pod Exec | Secrets Access | Deployments |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Platform Admin** | All | Full | Break-Glass Only | KMS/Vault Delegated | Full |
| **Namespace Admin** | Domain-specific | Full | Staging/Dev Only | Metadata View Only | Full |
| **Developer** | Team Namespace | Read / Logs | Denied (Prod) | Denied | Read Only |
| **CI/CD Pipeline** | Team Namespace | Read / Service | Denied | Denied | Create / Patch |
| **Security Auditor**| All | Read Only | Denied | Metadata Only | Read Only |
| **Monitoring Agent**| All | Metrics Endpoint| Denied | Denied | None |
