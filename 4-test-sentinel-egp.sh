#!/bin/bash

export VAULT_ADDR=http://127.0.0.1:8200

vault login -namespace=teamA -method=userpass username=colin password=password

vault write -namespace=teamA /sys/auth/userpass/tune default_lease_ttl="300" max_lease_ttl="300"

vault write -namespace=teamA auth/userpass/users/geoff password="password" token_policies="team-policy" token_max_ttl="300"
