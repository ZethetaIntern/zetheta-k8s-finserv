# FinServ Platform Operations Runbook

## 1. etcd Automated Backup & Disaster Recovery
- **Snapshot Frequency:** Every 4 hours to encrypted S3 bucket.
- **Manual Snapshot Command:**
  ```bash
  ETCDCTL_API=3 etcdctl snapshot save /var/backups/etcd-snapshot-$(date +%Y%m%d%H%M).db \
    --cacert=/etc/kubernetes/pki/etcd/ca.crt \
    --cert=/etc/kubernetes/pki/etcd/server.crt \
    --key=/etc/kubernetes/pki/etcd/server.key
kubectl cordon <NODE_NAME>
kubectl drain <NODE_NAME> --ignore-daemonsets --delete-emptydir-data --force
