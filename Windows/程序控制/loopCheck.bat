@echo on

:loop
echo Start checking 

rem ���������� check.bat* ��������Ҫ��windowtitle����֧��ģ����ѯ��ֻ���ں���*������

for /F "tokens=2 delims=," %%a in ('tasklist /fo csv /v /fi "windowTitle eq loopCheck.bat*"') do (          
      echo Infinity is exist, wait 5 sechond and re-check.
	  ping -n 5 127.1>nul
	  goto:loop	  
)

echo Infinity is not exist, and restart it
rem �������������������������д
notepad loopCheck.bat
goto :loop
 

