::
::���ű���һ����svn����Ŀ���룬Ȼ���������͵�tomcat�еĽű�����Ҫ�滻����
::
title "manage��Ŀһ�������ű�"
echo on
echo ��Ҫ��װsvn�����а汾��������path
echo ��Ҫ��װmaven�����а汾��������path

::����


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::�޸�begin                                                                                               ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::��Ŀ��
set projectName=hw-cloud-management-jenkins
::��Ŀ�µ�web����
set webProjectName=hw-cloud-management-web
::hw-web����
set hwWeb=hw-web
::��ĿsvnĿ¼
set svnURL= https://192.168.1.223:8443/svn/vtx-cloud/trunk/hw-cloud-management-jenkins
::�����滻��cloud.properties ·��
set cloudPropertyURL=E:\property\cloud.properties
::�����滻��custom.properties ·��
set customPropertyURL=E:\property\custom.properties
::tomcat ·�������\
set tomcatURL=F:\work\utils\apache-tomcat-7.0.69\

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::�޸�end                                                                                                           ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::tomcat �����̷�
set tomcatDiskNUM=%tomcatURL:~,2%��

::tomcat��webappĿ¼
set webapps=webapps\
::tomcat webapps��url
set tomcatWebAppURL=%tomcatURL%%webapps%
::source ·��
set source=src\main\resources
::hw-web�µ�source·��
set hwWebSource=%projectName%\%hwWeb%\%source%
::��Ŀ�µ�web��Ŀ�µ�source·�� 
set webProjectSource=%projectName%\%webProjectName%\%source%
::hw-web  ·��
set hwWebURL=%projectName%\%hwWeb%

rem 1������Դ��

call  svn checkout %svnURL%



rem 2�����ִ�гɹ� ��copy�����ļ���Ŀ¼�У�
if errorlevel 1 goto error
copy %cloudPropertyURL% %webProjectSource%
if errorlevel 1 goto error
copy %customPropertyURL% %hwWebSource%


rem 3�����ִ�гɹ� ����Ŀ¼ִ��ָ�� ִ��ant maven
if errorlevel 1 goto error
:: ��ת��hw-webĿ¼
cd %hwWebURL%
if errorlevel 1 goto error   
:: ����ant
call ant 
if errorlevel 1 goto error
:: ���ص���Ŀ��Ŀ¼
cd ..
if errorlevel 1 goto error
::ִ��maven������
call mvn clean install 


rem 4�����ִ�гɹ���copy war����tomcat����renameΪROOT.war

if errorlevel 1 goto error
::ǿ�Ƹ���war����tomcat��
copy /Y hw-web\target\hw-web.war %tomcatWebAppURL%
if errorlevel 1 goto error
::����tomcat���ڵ��̷�
%tomcatDiskNUM%
if errorlevel 1 goto error
::��tomcat��webappsĿ¼��
cd %tomcatWebAppURL% 
if errorlevel 1 goto error
::�������ROOT.war ��ɾ����
if exist ROOT.war del ROOT.war
if errorlevel 1 goto error
::������war��ΪROOT.war
ren hw-web.war  ROOT.war

rem 5�����ִ�гɹ��Ϳ���tomcat
if errorlevel 1 goto error
::���뵽tomcat��binĿ¼
cd ..\bin\ 
if errorlevel 1 goto error
::����startup.bat����tomcat
start startup.bat
if errorlevel 1 goto error

echo "�����ɹ�" 

goto end
:error
echo �д����� pause
:end
pause