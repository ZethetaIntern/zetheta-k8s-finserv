💳 Zetheta K8s FinServ
A security-focused Kubernetes platform blueprint for financial-services workloads. This repository demonstrates how to organize Kubernetes security controls, workload isolation, secrets management, observability, and deployment configuration for a FinServ-style environment.
Important: This repository is an engineering/demo project. Security controls and compliance-oriented documentation do not, by themselves, certify a deployment as PCI-DSS or RBI compliant. Validate all controls against your environment and applicable requirements before production use.

Overview
The project focuses on reducing workload risk through layered Kubernetes security controls and repeatable configuration. It includes resources for:
- Workload isolation: namespaces and Kubernetes NetworkPolicies
- Access control: Kubernetes RBAC configuration
- Secrets management: HashiCorp Vault-related configuration
- Pod hardening: pod-security settings and restricted runtime practices
- Admission control: policy-oriented configuration
- Service-to-service security: service-mesh configuration
- Observability and auditing: monitoring and audit-related resources
- Container builds: Dockerfile examples for sample services
- Operations: manifest-validation and RBAC helper scripts
- Helm: chart metadata and production values
Technology Stack
Technology	Purpose
Kubernetes	Workload orchestration and platform controls
Docker	Container image build configuration
Helm	Kubernetes packaging and configuration
HashiCorp Vault	Secrets-management integration
Kubernetes RBAC	Identity and permission management
NetworkPolicies / Calico	Workload network segmentation (compatible CNI required)
Istio	Service-mesh and mTLS configuration
Kyverno	Admission-policy configuration
Prometheus / Loki	Metrics and log observability
Falco	Runtime threat-detection concepts
Bash	Validation and operational helper scripts


Actual components and readiness depend on the manifests and cluster configuration. Review each component's configuration before applying it.
Repository Structure
zetheta-k8s-finserv/
├── .github/                 # Repository automation and workflow configuration
├── Dockerfiles/             # Sample container build definitions
├── docs/
│   ├── architecture/        # Architecture documentation
│   ├── compliance/          # Compliance-oriented documentation
│   ├── operations/          # Operational guidance
│   └── security/            # Security documentation
├── helm/                    # Helm chart metadata and values
├── k8s/
│   ├── admission-control/   # Admission-policy resources
│   ├── audit/                # Audit-related resources
│   ├── monitoring/           # Monitoring resources
│   ├── namespaces/           # Namespace definitions
│   ├── network-policies/    # Network segmentation policies
│   ├── pod-security/        # Pod security configuration
│   ├── rbac/                 # Roles, bindings, and access controls
│   ├── sample-deployments/  # Example workload manifests
│   ├── service-mesh/        # Service-mesh configuration
│   └── vault/                # Vault integration resources
├── scripts/
│   ├── generate-rbac-matrix.sh
│   └── validate-manifests.sh
├── README.md
└── SUBMISSION.md             # Project submission and architecture decisions
Prerequisites
Before testing the configuration, install and configure:
- A Kubernetes cluster (local or managed)
- kubectl configured for the intended cluster
- Docker, if building the sample container image
- Helm, if working with the Helm configuration
- Bash and any required cluster add-ons for the features you intend to test (for example, Vault, a compatible CNI, or a service mesh)
Use a disposable development cluster first. Some security and networking resources can affect cluster-wide behavior.
Getting Started
1. Clone the repository
git clone https://github.com/ZethetaIntern/zetheta-k8s-finserv.git
cd zetheta-k8s-finserv
2. Check cluster access
kubectl config current-context
kubectl cluster-info
kubectl get nodes
Confirm that the current context points to the intended test cluster before continuing.
3. Review and validate manifests
Read the manifests and related instructions before applying them. If the script's prerequisites are available, run:
bash scripts/validate-manifests.sh
You can also inspect the available files and run a preliminary client-side dry run:
find k8s -type f
kubectl apply --dry-run=client -f k8s/
A dry run is a preliminary syntax/client-side check, not a guarantee that every resource or dependency will work in the target cluster.
4. Apply resources selectively
Apply the relevant manifests in dependency order, starting with namespaces and then the required RBAC, network, security, secrets, monitoring, and workload resources. For example:
kubectl apply -f k8s/namespaces/
Review each directory before applying it. Do not apply every directory blindly: some resources depend on installed controllers, CRDs, CNI capabilities, certificates, or environment-specific values.
5. Verify resources
After applying the resources you selected, inspect their status:
kubectl get namespaces
kubectl get pods -A
kubectl get services -A
kubectl get networkpolicies -A
kubectl get events -A --sort-by=.metadata.creationTimestamp
A resource type may be unavailable until its corresponding controller or CRD is installed.
Security Practices Demonstrated
- Least-privilege access through RBAC
- Network segmentation using NetworkPolicies
- Separation of workloads by namespace
- Centralized secrets-management integration
- Pod security hardening
- Admission-policy enforcement concepts
- Service-to-service encryption concepts with a service mesh
- Audit, metrics, logging, and runtime-monitoring integration
These controls require correct configuration, compatible cluster components, and testing. Never store production credentials in Git or commit real secrets to this repository.
Useful Commands
# Inspect workloads across namespaces
kubectl get pods -A

# Inspect RBAC resources
kubectl get roles,rolebindings -A
kubectl get clusterroles,clusterrolebindings

# Inspect network policies
kubectl get networkpolicies -A

# Review recent cluster events
kubectl get events -A --sort-by=.metadata.creationTimestamp

# Run the RBAC helper (review the script first)
bash scripts/generate-rbac-matrix.sh
Run scripts only after reviewing their contents and understanding their prerequisites.
Troubleshooting
- Pods remain Pending: check node capacity, scheduling constraints, storage, and events.
- Pods cannot communicate: review NetworkPolicies, labels/selectors, and CNI support.
- Access denied: inspect the active Kubernetes context and relevant RoleBindings or ClusterRoleBindings.
- Vault or service-mesh resources fail: verify the required controller, CRDs, policies, and certificates.
- Manifest validation fails: check the reported file and ensure required command-line tools are available.
Useful diagnostics:
kubectl describe pod <pod-name> -n <namespace>
kubectl logs <pod-name> -n <namespace>
kubectl get events -n <namespace> --sort-by=.metadata.creationTimestamp
Documentation
- [Architecture decisions and project submission](SUBMISSION.md)
- [Kubernetes manifests](k8s/)
- [Helm configuration](helm/)
- [Operational scripts](scripts/)
- [Project documentation](docs/)
Learning Outcomes
This project can help learners practice Kubernetes security fundamentals, workload isolation, RBAC, secrets-management integration, policy-based controls, container configuration, and operational troubleshooting in a financial-services scenario.
Author
Mayank Rawal
GitHub: @mayankrawall
License
No license is specified here. Check with the repository owner before reusing or redistributing this project.
