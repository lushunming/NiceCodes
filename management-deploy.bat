::
::本脚本是一键从svn拿项目代码，然后打包，发送到tomcat中的脚本，需要替换其中
::
title "manage项目一键发布脚本"
echo on
echo 需要安装svn命令行版本并且配置path
echo 需要安装maven命令行版本并且配置path

::变量


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::修改begin                                                                                               ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::项目名
set projectName=hw-cloud-management-jenkins
::项目下的web包名
set webProjectName=hw-cloud-management-web
::hw-web名称
set hwWeb=hw-web
::项目svn目录
set svnURL= https://192.168.1.223:8443/svn/vtx-cloud/trunk/hw-cloud-management-jenkins
::用来替换的cloud.properties 路径
set cloudPropertyURL=E:\property\cloud.properties
::用来替换的custom.properties 路径
set customPropertyURL=E:\property\custom.properties
::tomcat 路径后面带\
set tomcatURL=F:\work\utils\apache-tomcat-7.0.69\

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::修改end                                                                                                           ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::tomcat 所在盘符
set tomcatDiskNUM=%tomcatURL:~,2%　

::tomcat下webapp目录
set webapps=webapps\
::tomcat webapps的url
set tomcatWebAppURL=%tomcatURL%%webapps%
::source 路径
set source=src\main\resources
::hw-web下的source路径
set hwWebSource=%projectName%\%hwWeb%\%source%
::项目下的web项目下的source路径 
set webProjectSource=%projectName%\%webProjectName%\%source%
::hw-web  路径
set hwWebURL=%projectName%\%hwWeb%

rem 1）下载源码

call  svn checkout %svnURL%



rem 2）如果执行成功 就copy配置文件到目录中，
if errorlevel 1 goto error
copy %cloudPropertyURL% %webProjectSource%
if errorlevel 1 goto error
copy %customPropertyURL% %hwWebSource%


rem 3）如果执行成功 进入目录执行指令 执行ant maven
if errorlevel 1 goto error
:: 跳转到hw-web目录
cd %hwWebURL%
if errorlevel 1 goto error   
:: 调用ant
call ant 
if errorlevel 1 goto error
:: 返回到项目根目录
cd ..
if errorlevel 1 goto error
::执行maven命令打包
call mvn clean install 


rem 4）如果执行成功就copy war包到tomcat并且rename为ROOT.war

if errorlevel 1 goto error
::强制复制war包到tomcat下
copy /Y hw-web\target\hw-web.war %tomcatWebAppURL%
if errorlevel 1 goto error
::进入tomcat所在的盘符
%tomcatDiskNUM%
if errorlevel 1 goto error
::到tomcat的webapps目录下
cd %tomcatWebAppURL% 
if errorlevel 1 goto error
::如果存在ROOT.war 就删除他
if exist ROOT.war del ROOT.war
if errorlevel 1 goto error
::重命名war包为ROOT.war
ren hw-web.war  ROOT.war

rem 5）如果执行成功就开启tomcat
if errorlevel 1 goto error
::进入到tomcat的bin目录
cd ..\bin\ 
if errorlevel 1 goto error
::调用startup.bat启动tomcat
start startup.bat
if errorlevel 1 goto error

echo "发布成功" 

goto end
:error
echo 有错误发生 pause
:end
pause