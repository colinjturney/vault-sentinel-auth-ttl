#!/bin/bash

export VAULT_ADDR="http://127.0.0.1:8200"

vault login root

# Use EGP with teamA namespace

POLICYEGPMETHOD=$(base64 egp-auth-method-max-ttl.sentinel)

vault write /sys/policies/egp/method-max-ttl \
        policy="${POLICYEGPMETHOD}" \
        paths="/teamA/auth/userpass/users/*" \
        enforcement_level="hard-mandatory"


POLICYEGPTUNE=$(base64 egp-auth-tune-max-ttl.sentinel)

vault write /sys/policies/egp/tune-max-ttl \
        policy="${POLICYEGPTUNE}" \
        paths="/teamA/sys/auth/userpass/tune" \
        enforcement_level="hard-mandatory"

# Use RGP with teamB namespace

POLICYRGP=$(base64 rgp-token-max-ttl.sentinel)

vault write -namespace=teamB /sys/policies/rgp/token-max-ttl \
        policy="${POLICYRGP}" \
        enforcement_level="hard-mandatory"