#!/bin/bash
echo "Validating FinServ Kubernetes Manifests..."
find k8s/ -name "*.yaml" -o -name "*.yml" | while read -r file; do
  echo "Checking syntax: $file"
  kubectl apply --dry-run=client -f "$file" > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "✓ $file valid"
  else
    echo "✗ $file has syntax errors"
  fi
done
