# FinServ Container Image Security & Supply Chain Pipeline

## 1. Multi-Stage Distroless Build
- Dockerfiles use multi-stage builds (`golang:1.22-alpine` builder) dropping compilers, package managers, and interactive shells (`bash`/`sh`).
- Final images base on `gcr.io/distroless/static:nonroot` with UID `65532`.

## 2. Vulnerability Scanning Gate (Trivy)
All container images must pass CI gate before pushing to registry:
```bash
trivy image --exit-code 1 --severity CRITICAL,HIGH --ignore-unfixed <IMAGE_TAG>
cosign sign --key k8s://kms-key finserv-registry.internal/payments/service@sha256:...
