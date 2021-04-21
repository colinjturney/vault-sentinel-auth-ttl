#!/bin/bash

export VAULT_ADDR="http://127.0.0.1:8200"

vault login root

# teamA

vault auth enable -namespace=teamA userpass

vault policy write -namespace=teamA team-policy team-policy.hcl

vault policy write -namespace=teamA teama-policy teama-policy.hcl

vault write -namespace=teamA auth/userpass/users/colin password="password" token_policies="team-policy,teama-policy,default"

# teamB

vault auth enable -namespace=teamB userpass 

vault policy write -namespace=teamB team-policy team-policy.hcl

vault write -namespace=teamB /sys/auth/userpass/tune default_lease_ttl="300" max_lease_ttl="300"

vault write -namespace=teamB auth/userpass/users/colin password="password" token_policies="default,team-policy,token-max-ttl" token_explicit_max_ttl="300"

echo ${VAULT_TOKEN}