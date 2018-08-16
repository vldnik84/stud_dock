#!/bin/bash

CONF_MADM=${MADM_DIR}/config.inc.php
MADM_TEMP=${MADM_DIR}/tmp

if [ ! -e ${MADM_DIR}/composer.lock ]
then
    composer install -d ${MADM_DIR}
fi

if [ ! -e ${CONF_MADM} ]
then
    cp ${MADM_DIR}/config.sample.inc.php ${CONF_MADM}
    sed -i "s#\$cfg\['Servers'\]\[\$i\]\['host'\] = 'localhost';#\$cfg\['Servers'\]\[\$i\]\['host'\] = '${DB_CONT}';#" ${CONF_MADM}
fi

if [ ! -e ${MADM_TEMP} ]
then
    mkdir ${MADM_TEMP}
    chown www-data:www-data ${MADM_TEMP}
    chmod 700 ${MADM_TEMP}
fi

service php7.2-fpm start
nginx -g 'daemon off;'
