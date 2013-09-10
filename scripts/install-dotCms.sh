echo "DOWNLOAD DOTCMS ..."
wget ${DOTCMS_DOWNLOAD_URL} -O ${DOWNLOAD_DIRECTORY}/${DOWNLOAD_FILE_NAME}
echo "INSTALL DOTCMS ..."
mkdir ${DOTCMS_PARENT_HOME}
unzip ${DOWNLOAD_DIRECTORY}/${DOWNLOAD_FILE_NAME} -d ${DOTCMS_PARENT_HOME}
echo "MODIFY ROOT.XML: Set username and password for postgresql ..."
sed -i "s/{your db user}/${DOTCMS_POSTGRESQL_USER}/g" ${DOTCMS_TOMCAT_CONF_ROOT}
sed -i "s/{your db password}/${DOTCMS_POSTGRESQL_PASSWORD}/g" ${DOTCMS_TOMCAT_CONF_ROOT}
echo "MODIFY SERVER.XML: Set IP and PORT for localhost ..."
sed -i "s/<Server port=\"8005\"/<Server address=\"${DOTCMS_SERVER_IP}\" port=\"${DOTCMS_SERVER_PORT}\"/g" ${DOTCMS_TOMCAT_CONF_SERVER}
echo "SET RIGHT FOR SCRIPTS ..."
chmod 755 ${DOTCMS_HOME}/bin/*.sh
chmod 755 ${DOTCMS_TOMCAT}/bin/*.sh

