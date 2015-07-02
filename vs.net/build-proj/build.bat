@echo off
set basePubFolder=%cd%\publish
set configFolder=%cd%\config
set hostFolderConfig=%configFolder%\%~2.txt
svn update ../../

  
if not exist %basePubFolder% md %basePubFolder%
cd ..\SourceCode
for /f "tokens=*" %%i in (%configFolder%\%1.txt) do (  
  if not "%%i" =="%1" (call:buildSingle "%%i")
)
cd ..\build
goto :eof

:buildSingle  
 
  set webProject=%1
  set publishFolder="%basePubFolder%\%~n1" 
        
  if exist %publishFolder% call:Del %publishFolder%
  
  msbuild %webProject% /t:ResolveReferences;Compile;_CopyWebApplication /t:_WPPCopyWebApplication /p:Configuration=Release /p:WebProjectOutputDir=%publishFolder%  /p:_ResolveReferenceDependencies=true   
  copy ..\build\ETong.Utility.dll.config %basePubFolder%\%~n1\bin  
  
  if not "%hostFolderConfig%" == "%configFolder%\"  call:copyToHost %webProject% %publishFolder% 
  
goto :eof


:Del
rd %1% /q /s
md %1%
goto :eof

:copyToHost
  for /f "tokens=*" %%j in (%hostFolderConfig%) do call:copyReal "%2" "%%j\%~1"
goto :eof

:copyReal
 ::rd "\\%~p2" /q /s
 set publishHost=%~p2%
 set publishHost=%publishHost: =_%
 xcopy "%~1" "\\%publishHost%" /y /s /r /e /h
goto :eof