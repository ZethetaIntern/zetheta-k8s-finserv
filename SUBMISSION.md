# Project Submission: Security-Hardened Kubernetes Platform
**Company:** FinServ Digital  
**Lead Platform Engineer:** Mayank Rawal  
**Target Compliance:** RBI Cybersecurity Framework & PCI-DSS v4.0 Level 1  

---

## 1. Executive Summary
Successfully migrated FinServ Digital's 20 financial microservices from a legacy flat VM network to an environment-separated, zero-trust Kubernetes architecture capable of sustaining 5x transaction scaling.

---

## 2. Architecture Decision Records (10 ADRs)
1. **CNI Selection (Calico):** Selected Calico for native L3/L4 NetworkPolicy enforcement with minimal performance overhead.
2. **Environment Separation:** Chose physical cluster isolation across Dev, Staging, and Production to eliminate blast radius.
3. **Secrets Management (HashiCorp Vault):** Replaced native Base64 secrets with Vault dynamic credentials and Transit engine encryption.
4. **Admission Control (Kyverno):** Selected Kyverno over Gatekeeper for native Kubernetes YAML declarative policy authoring.
5. **Runtime Security (Falco):** Implemented Falco kernel syscall tracing to detect interactive shells and unauthorized connections.
6. **Container Base Image (Distroless):** Adopted Google Distroless non-root images to drop package managers and shells from runtime.
7. **Pod Security Standards (Restricted):** Enforced PSS Restricted mode in production namespaces to disable privilege escalation and enforce read-only root filesystems.
8. **Service Mesh (Istio):** Implemented Istio STRICT mTLS to guarantee encrypted and authenticated pod-to-pod communication.
9. **Observability Stack (Prometheus & Loki):** Deployed Prometheus for metrics and Loki for log aggregation to satisfy the 1-year PCI-DSS audit retention rule.
10. **Autoscaling Strategy (HPA on CPU & Memory):** Tuned scale-up window to 0 seconds and scale-down to 300 seconds to mitigate traffic spikes during financial peak periods.

---

## 3. Innovative Concept
**Dynamic Compliance-as-Code Controller (Auto-Remediating PCI-DSS Operator):**
A custom Kubernetes CRD and controller that continuously scans cluster state against PCI-DSS controls, automatically reverting non-compliant NetworkPolicies or unencrypted volumes within 5 seconds without manual platform engineer intervention.
