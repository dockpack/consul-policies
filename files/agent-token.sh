#!/bin/bash -e
# read token for $1

# Fail if a pipes fails
set -o pipefail

# Fail if consul is not available
command -v consul > /dev/null || echo $?

# Search in Description field of Consul token list.
if [ -z "$1" ]
then
    echo 'Search argument expected.'
    exit 1
fi

# Access token
if [ -z "$CONSUL_HTTP_TOKEN" ]
then
    echo '$CONSUL_HTTP_TOKEN not exported.'
    exit 80
fi

# Don't show master token
if test $(echo 'Master' | grep -c $1) == 1
then
    echo 'Forbidden search.'
    exit 22
fi

# Query the agent token
consul acl token read \
    -id="$(consul acl token list|grep -B1 "$1"|head -1|sed 's/AccessorID:       //')" \
    | grep SecretID \
    | sed 's/SecretID:\s\{2,\}//'
