# Read payments key-value secrets
path "secret/data/payments/*" {
  capabilities = ["read", "list"]
}

path "secret/metadata/payments/*" {
  capabilities = ["list"]
}

# Transit engine permissions for cardholder data encryption/decryption
path "transit/encrypt/payments-key" {
  capabilities = ["update"]
}

path "transit/decrypt/payments-key" {
  capabilities = ["update"]
}
