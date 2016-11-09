title redis start
::redis 路径 可以修改
set redisPath=D:\deployProjects\redis\redis\redis-latest(3.0.501)\
::redis 所在盘符
set redisDiskNUM=%redisPath:~,2%
%redisDiskNUM%
cd %redisPath%
redis-server.exe redis.windows.conf