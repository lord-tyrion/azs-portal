INSTALL_HOME=.

PG_APPLICATION_NAME=postgresql
PG_INSTALL_SCRIPT=install-postgresql.sh

JAVA_APPLICATION_NAME=java-oracle
JAVA_INSTALL_SCRIPT=install-oracle-jdk-1.7.sh

DOTCMS_INSTALL_SCRIPT=install-dotCms.sh
DOTCMS_DOWNLOAD_URL=dotcms.com/physical_downloads/release_builds/dotcms_2.3.2.zip?r=1375907336213
DOWNLOAD_DIRECTORY=~/Letöltések
DOWNLOAD_FILE_NAME=dotCMS.zip
DOTCMS_PARENT_HOME=~/dotCMS
DOTCMS_HOME=${DOTCMS_PARENT_HOME}/dotserver
DOTCMS_TOMCAT=${DOTCMS_HOME}/tomcat
DOTCMS_TOMCAT_CONF_ROOT=${DOTCMS_TOMCAT}/conf/Catalina/localhost/ROOT.xml
DOTCMS_TOMCAT_CONF_SERVER=${DOTCMS_TOMCAT}/conf/server.xml
DOTCMS_POSTGRESQL_USER=postgres
DOTCMS_POSTGRESQL_PASSWORD=qwe123
DOTCMS_SERVER_IP="208.250.1.102"
DOTCMS_SERVER_PORT="8005"

chmod 755 ${INSTALL_HOME}/*.sh

testApplicationInstalled() {
	if [ -z "$1" ]                           # Is parameter #1 zero length?
   	then
		echo "-Parameter application is zero length.-"  # Or no parameter passed.
		return -1
	else
		echo "-Parameter application is \"$1\".-"
	fi

	if [ $(dpkg -l | grep -c $1) -ne 0 ]
	then
		echo "$1 INSTALLED"
		TEMP=0
		return 0;
	else
		echo "$1 NOT INSTALLED"
		TEMP=1
		return 1
	fi 
}

resolveApplicationDependency() {
	echo "TEST $1 APPLICATION INSTALLED ..."

	if [ -z "$1" ]                           # Is parameter #1 zero length?
   	then
		echo "-Parameter application is zero length.-"  # Or no parameter passed.
		return -1
	else
		echo "-Parameter application is \"$1\".-"
	fi

	if [ -z "$2" ]                           # Is parameter #2 zero length?
   	then
		echo "-Parameter install script is zero length.-"  # Or no parameter passed.
		return -1
	else
		echo "-Parameter install script is \"$2\".-"
	fi

	testApplicationInstalled $1

	if [ ${TEMP} -eq 0 ]
	then

		return 0
	else
		echo "INSTALL $1 ..."
		sh ${INSTALL_HOME}/$2

		testApplicationInstalled $1
	fi
}

cd ${INSTALL_HOME}
pwd

resolveApplicationDependency ${PG_APPLICATION_NAME} ${PG_INSTALL_SCRIPT}

resolveApplicationDependency ${JAVA_APPLICATION_NAME} ${JAVA_INSTALL_SCRIPT}

sh ${INSTALL_HOME}/${DOTCMS_INSTALL_SCRIPT}

