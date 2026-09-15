# FinServ Digital - Service Dependency & Namespace Hierarchy

## 1. Domain Separation (4 Namespaces)
Each domain is isolated in its own namespace with default-deny network boundaries:

* **prod-payments (CDE):** Contains services 6 to 10 (Payment Gateway, Transaction Processor, Settlement Engine, Refund Service, Recurring Payments Scheduler). Highest security tier with strict Pod Security Standards (Restricted).
* **prod-risk:** Contains services 11 to 15 (Fraud Detection Engine, AML Screening, Risk Scoring, Compliance Reporting, Audit Log Aggregator). Receives synchronous risk queries and asynchronous event streams from payments.
* **prod-customer:** Contains services 16 to 20 (User Management, KYC Verification, Notification Service, Customer Support, Preference Manager). Completely isolated from direct access to payment card databases.
* **prod-platform:** Contains services 1 to 5 (API Gateway, Service Registry, Configuration Service, Health Monitor, Report Generator).

## 2. Allowed Communication Rules
- `API Gateway` (platform) -> `Payment Gateway` (payments) on Port 8443 (TLS 1.3).
- `Payment Gateway` -> `Transaction Processor` on Port 8443.
- `Transaction Processor` -> `Fraud Detection Engine` (risk) on Port 9090 (gRPC).
- `Transaction Processor` -> `Audit Log Aggregator` on Port 514 (Syslog/TLS).
- `Payment Gateway` -> `Notification Service` (customer) on Port 8080 (Async Event).
- **All other inter-service paths are dropped by default-deny network policy.**
