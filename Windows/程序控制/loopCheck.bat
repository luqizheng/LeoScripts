@echo on

:loop
echo Start checking 

rem ：请把下面的 check.bat* 更换你想要的windowtitle，不支持模糊查询，只能在后面*来区别

for /F "tokens=2 delims=," %%a in ('tasklist /fo csv /v /fi "windowTitle eq loopCheck.bat*"') do (          
      echo Infinity is exist, wait 5 sechond and re-check.
	  ping -n 5 127.1>nul
	  goto:loop	  
)

echo Infinity is not exist, and restart it
rem 这里是重启程序，我这里是随便写
notepad loopCheck.bat
goto :loop
 

