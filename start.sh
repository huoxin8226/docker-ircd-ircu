#!/bin/sh

# ######################################
# default setting
# ######################################
# IRCD_GENERAL_NAME:            "localhost.localdomain"
# IRCD_GENERAL_DESCRIPTION:     "localhost.localdomain"
# IRCD_ADMIN_CONTACT:           root@localhost
# IRCD_CLITENT_PASSWD:          none
echo "---> setting start"

if [ -z "${IRCD_GENERAL_NAME}" ]; then
        IRCD_GENERAL_NAME="localhost.localdomain"
fi
if [ -z "${IRCD_GENERAL_DESCRIPTION}" ]; then
        IRCD_GENERAL_DESCRIPTION="localhost.localdomain"
fi
if [ -z "${IRCD_ADMIN_CONTACT}" ]; then
        IRCD_ADMIN_CONTACT=root@localhost
fi
if [ -n "${IRCD_CLITENT_PASSWD}" ]; then
        IRCD_CLITENT_PASSWD_CONF='password = "'$IRCD_CLITENT_PASSWD'";'
fi

# phpLDAPadmin config
sed -i "s/CONFIG_IRCD_GENERAL_NAME/${IRCD_GENERAL_NAME}/g" /etc/ircd/ircd.conf
sed -i "s/CONFIG_IRCD_GENERAL_DESCRIPTION/${IRCD_GENERAL_DESCRIPTION}/g" /etc/ircd/ircd.conf
sed -i "s/CONFIG_IRCD_ADMIN_CONTACT/${IRCD_ADMIN_CONTACT}/g" /etc/ircd/ircd.conf
sed -i "s/CONFIG_IRCD_CLITENT_PASSWD/${IRCD_CLITENT_PASSWD_CONF}/g" /etc/ircd/ircd.conf

echo "---> setting end"
echo "---> start ircd-ircu"

su - irc -c "/usr/sbin/ircd-ircu -n"
