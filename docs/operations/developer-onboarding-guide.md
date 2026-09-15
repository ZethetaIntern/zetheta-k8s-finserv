# FinServ Developer Onboarding Guide

## Quickstart for Microservice Deployment
1. **Clone Helm Starter:** Use standard template in `helm/`.
2. **Configure Values:** Update `values-dev.yaml` with your image tag.
3. **Deploy to Dev:**
   ```bash
   helm upgrade --install my-service ./helm -f ./helm/values-dev.yaml -n dev-payments
kubectl logs -l app=my-service -n dev-payments --tail=100
