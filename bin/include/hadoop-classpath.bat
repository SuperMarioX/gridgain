::
:: @bat.file.header
:: _________        _____ __________________        _____
:: __  ____/___________(_)______  /__  ____/______ ____(_)_______
:: _  / __  __  ___/__  / _  __  / _  / __  _  __ `/__  / __  __ \
:: / /_/ /  _  /    _  /  / /_/ /  / /_/ /  / /_/ / _  /  _  / / /
:: \____/   /_/     /_/   \_,__/   \____/   \__,_/  /_/   /_/ /_/
::
:: Version: @bat.file.version
::

::
:: Hadoop class path resolver.
::

::
:: Check HADOOP_HOME
::

@echo off

if not defined HADOOP_HOME goto :eof

set HADOOP_HOME=%HADOOP_HOME:"=%

if %HADOOP_HOME:~-1,1% == \ (
    set HADOOP_HOME=%HADOOP_HOME:~0,-1%
)

::
:: Setting all hadoop modules
::

set HADOOP_COMMON_HOME=%HADOOP_HOME%\share\hadoop\common
set HADOOP_HDFS_HOME=%HADOOP_HOME%\share\hadoop\hdfs
set HADOOP_MAPRED_HOME=%HADOOP_HOME%\share\hadoop\mapreduce

::
:: Libraries included in classpath.
::

set CP=%HADOOP_COMMON_HOME%\lib\*;%HADOOP_MAPRED_HOME%\lib\*;%HADOOP_MAPRED_HOME%\lib\*

for /f %%f in ('dir /B %HADOOP_COMMON_HOME%\hadoop-common-*') do call :concat %HADOOP_COMMON_HOME%\%%f
for /f %%f in ('dir /B %HADOOP_HDFS_HOME%\hadoop-hdfs-*') do call :concat %HADOOP_HDFS_HOME%\%%f
for /f %%f in ('dir /B %HADOOP_MAPRED_HOME%\hadoop-mapreduce-client-common-*') do call :concat %HADOOP_MAPRED_HOME%\%%f
for /f %%f in ('dir /B %HADOOP_MAPRED_HOME%\hadoop-mapreduce-client-core-*') do call :concat %HADOOP_MAPRED_HOME%\%%f

set GRIDGAIN_HADOOP_CLASSPATH=%CP%
set HADOOP_COMMON_HOME=%HADOOP_HOME%\share\hadoop\common

goto :eof

:concat
    set file=%1
    if %file:~-9,9% neq tests.jar set CP=%CP%;%1
goto :eof
