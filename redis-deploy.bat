title redis start
::redis ·�� �����޸�
set redisPath=D:\deployProjects\redis\redis\redis-latest(3.0.501)\
::redis �����̷�
set redisDiskNUM=%redisPath:~,2%
%redisDiskNUM%
cd %redisPath%
redis-server.exe redis.windows.conf