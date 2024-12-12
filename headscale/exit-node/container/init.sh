#!/bin/sh

/usr/local/bin/headscale users create exit-node-user

TAILSCALE_AUTHKEY="$(/usr/local/bin/headscale preauthkeys create --ephemeral -e 15m -o json -u exit-node-user | jq -r '.key')"
export TAILSCALE_AUTHKEY

/usr/local/bin/containerboot
