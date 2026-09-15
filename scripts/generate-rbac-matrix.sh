#!/bin/bash
echo "Extracting RBAC permissions across personas..."
kubectl auth can-i --list --namespace=prod-payments
