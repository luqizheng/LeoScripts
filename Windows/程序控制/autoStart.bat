@echo off
echo Start checking 
rem ���������� check.bat* ��������Ҫ��windowtitle����֧��ģ����ѯ��ֻ���ں���*������
for /F "tokens=2 delims=," %%a in ('tasklist /fo csv /v /fi "windowTitle eq autoStart.bat*"') do (          
      rem echo Infinity is exist, wait 5 sechond and re-check.
	  rem ping -n 5 127.1>nul
	  exit
)

echo Infinity is not exist, and restart it
rem �������������������������д
start notepad autoStart.bat
exit

 

