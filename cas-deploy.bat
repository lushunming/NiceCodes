
::bin Ŀ¼
set bin=bin

::tomcat ·�������\
set tomcatURL=D:\deployProjects\tomcat-cas-server\
::�����滻�������ļ���·��
set propertyURL=D:\cas.properties
::tomcat\bin ·�������\
set tomcatBInURL=%tomcatURL%%bin%
::classes·��
set classDirectory=webapps\cas\WEB-INF\classes
set classDirectoryURL=%tomcatURL%%classDirectory%


copy %propertyURL% %classDirectoryURL%

::tomcat �����̷�
set tomcatDiskNUM=%tomcatURL:~,2%��
%tomcatDiskNUM%
cd %tomcatBInURL%
::����startup.bat����tomcat
start startup.bat
pause