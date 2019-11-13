#!/bin/bash
# Initialize admin user before starting

GITEA="/usr/bin/gitea -c $GITEA_CONFIG_FILE"

if [[ ! -z "$ADMIN_USER" ]]
then
    $GITEA migrate
    $GITEA admin create-user --username $ADMIN_USER --password $ADMIN_PASSWORD --email $ADMIN_EMAIL --admin
fi
exec "$@"