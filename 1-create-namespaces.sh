#!/bin/bash

export VAULT_ADDR="http://127.0.0.1:8200"

vault login root

# Create Namespace Structure and Secrets Engines

vault namespace create teamA

vault secrets enable -namespace=teamA -path=secret/ kv

vault kv put teamA/secret/hello value=world

vault namespace create teamB

vault secrets enable -namespace=teamB -path=secret/ kv

vault kv put teamB/secret/hello value=world
