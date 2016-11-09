
::bin 目录
set bin=bin

::tomcat 路径后面带\
set tomcatURL=D:\deployProjects\tomcat-cas-server\
::用于替换的配置文件的路径
set propertyURL=D:\cas.properties
::tomcat\bin 路径后面带\
set tomcatBInURL=%tomcatURL%%bin%
::classes路径
set classDirectory=webapps\cas\WEB-INF\classes
set classDirectoryURL=%tomcatURL%%classDirectory%


copy %propertyURL% %classDirectoryURL%

::tomcat 所在盘符
set tomcatDiskNUM=%tomcatURL:~,2%　
%tomcatDiskNUM%
cd %tomcatBInURL%
::调用startup.bat启动tomcat
start startup.bat
pause