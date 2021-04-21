#!/bin/bash

export VAULT_ADDR=http://127.0.0.1:8200

# vault login -namespace=teamA -method=userpass username=colin password=password

# #vault write -namespace=teamA auth/userpass/users/geoff password="password" token_policies="team-policy" token_max_ttl="120"

# vault kv get teamA/secret/hello

# vault token lookup

vault login -namespace=teamB -method=userpass username=colin password=password

#vault kv get teamB/secret/hello

vault token lookup