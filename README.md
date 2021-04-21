# Vault Sentinel Auth TTL

A working example of how one could apply both sentinel EGP and RGP policies to control how long authentication tokens could be created for the userpass authentication method.

## Requirements

- Vault Enterprise binary installed in your PATH
- A working Vault license (written to vault-license.txt) if you want it to run more than 6 hours

## What the demo shows

The demo shows how Sentinel policies can control the following aspects of Vault usage:
- Controlling the `explicit_max_ttl_seconds` for an issued authentication token to be no longer than 5 minutes
via an Role Governing Policy.
- Controlling the `token_max_ttl` configured on the userpass authentication method to be no longer than 5 minutes
via an Endpoint Governing Policy on `/auth/userpass/users/*`.
- Controlling the `default_lease_ttl` and `max_lease_ttl` configured on the userpass authentication method to be no
longer than 5 minutes, via an Endpoint Governing Policy on `/teamA/auth/userpass/users/*`.

## How to run the demo

Run the scripts in numerical order, whilst observing and understanding what they do by reading the code. To kill Vault at any time, just run `./99-kill-vault`

## Evaluation of the RGP vs EGP Approaches

### Role Governing Policy
Using a RGP means that if a token is created with an explicit max TTL of more than 5 minutes, it won't be usable in Vault
since the policy would evaluate to false and thus Sentinel would prevent any operation using said token from being performed.

This has the impact of preventing the token from being able to perform any operations in Vault. However, as an RGP, it is effectively evaluated on every operation with the token that has the policy attached to it and compared to an EGP, could be computationally more expensive.

### Endpoint Governing Policy
Using an EGP means that the Sentinel policy is only evaluated whenever a request is made against that endpoint, making it computationally less of a problem. 

However, it does mean that additional controls (i.e. further sentinel policies) may need to be put in place to prevent namespace administrators from being able to create new authentication methods on non-standard paths (i.e. paths not matching the EGP path) that then have TTLs configured on them that circumvent the controls.

# Notes
- No warranty given or implied.

# TODO
- Improve this README and code comments.
