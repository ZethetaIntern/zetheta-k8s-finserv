# FinServ Incident Response Playbook - Scenario B3.3

## 1. Attack Vectors Contained
- **Lateral Port Scanning:** Blocked at L3/L4 by default-deny NetworkPolicy.
- **Cross-Namespace Secrets Theft:** Blocked by namespace-isolated RBAC rules and lack of direct etcd access.
- **External Data Exfiltration:** Alerted by Falco rule `Potential Data Exfiltration` and dropped by egress filter.

## 2. On-Call Engineer Triage Protocol
1. **Quarantine Compromised Pod:**
   Apply isolation label immediately to block all network traffic via emergency policy:
   ```bash
   kubectl label pod <COMPROMISED_POD> quarantine=true -n prod-payments
