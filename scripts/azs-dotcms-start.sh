DOTCMS_DOWNLOAD_URL=dotcms.com/physical_downloads/release_builds/dotcms_2.3.2.zip?r=1375907336213
DOWNLOAD_DIRECTORY=~/Letöltések
DOWNLOAD_FILE_NAME=dotCMS.zip
DOTCMS_PARENT_HOME=~/dotCMS
export DOTCMS_HOME=${DOTCMS_PARENT_HOME}/dotserver
DOTCMS_TOMCAT=${DOTCMS_HOME}/tomcat
DOTCMS_TOMCAT_CONF_ROOT=${DOTCMS_TOMCAT}/conf/Catalina/localhost/ROOT.xml
DOTCMS_TOMCAT_CONF_SERVER=${DOTCMS_TOMCAT}/conf/server.xml
DOTCMS_POSTGRESQL_USER=postgres
DOTCMS_POSTGRESQL_PASSWORD=qwe123
DOTCMS_SERVER_IP="208.250.1.102"
DOTCMS_SERVER_PORT="8005"
export JAVA_HOME=/usr/lib/jvm/java-7-oracle

echo "START SERVER ..."
sh ${DOTCMS_HOME}/bin/startup.sh
