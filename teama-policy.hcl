# Create, update, and delete auth methods
path "sys/auth/*"
{
  capabilities = ["create", "update", "delete", "sudo"]
}

# Create users on userpass auth method
path "/identity/*"{
   capabilities = ["create", "read", "update", "delete", "list"]
}

# Configure auth methods
path "sys/auth" {
  capabilities = [ "read", "list" ]
}

# Configure auth methods
path "sys/auth/*" {
  capabilities = [ "create", "update", "read", "delete", "list", "sudo" ]
}

# Manage userpass auth methods
path "auth/userpass/*" {
  capabilities = [ "create", "read", "update", "delete" ]
}

# Enable and manage secrets engines
path "sys/mounts/*" {
   capabilities = ["create", "read", "update", "delete", "list"]
}

# List available secrets engines
path "sys/mounts" {
  capabilities = [ "read" ]
}

# Manage tokens
path "auth/token/*" {
  capabilities = [ "create", "read", "update", "delete", "sudo" ]
}

# Request access to secrets at 'secret'
path "secret/*" {
   capabilities = ["create","read","update","delete","list"]
}
