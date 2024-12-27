#!/bin/sh

set -e

if [ -f /config/config.yaml ]; then
    echo "Config file already exists, skipping"
    exit 0
fi

decode() {
    echo "$1" | base64 -d | sed 's/^/              /g'
}

KEY_1_RSA_KEY=$(decode "$KEY_1_RSA_KEY")
KEY_2_EC_KEY=$(decode "$KEY_2_EC_KEY")
KEY_3_EC_KEY=$(decode "$KEY_3_EC_KEY")

(
    echo "cat <<EOF"
    cat /config.template.yaml
    echo EOF
) | sh >/config/config.yaml
