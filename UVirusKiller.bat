@echo off
cacls.exe "%SystemDrive%\System Volume Information" >nul 2>nul
if %errorlevel%==0 goto main
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
echo Set RequestUAC = CreateObject^("Shell.Application"^)>"%temp%\getadmin.vbs"
echo RequestUAC.ShellExecute "%~s0","","","runas",1 >>"%temp%\getadmin.vbs"
echo WScript.Quit >>"%temp%\getadmin.vbs"
"%temp%\getadmin.vbs" /f
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
exit

:main
color 2f
cls

echo ----------KILL EVERY AUTORUN VIRUS----------
echo -------作者:Tech4Every1-2333Cl VER1.3-------
echo 推荐在PE环境下运行本工具以使用第一种方案清除autorun病毒
echo 请确保该系统没有染上U盘内的病毒
echo 请按任意键继续，否则直接关闭窗口吧!
pause>nul
cls

echo 请输入染毒U盘的盘符(可在"我的电脑"里面看到)然后回车
echo 例如 G:
set /p vol=

cls
echo 最后请备份好U盘上所有EXE和VBS文件,继续执行操作会删除U盘根目录上所有EXE和VBS文件!
echo 请再次确认该脚本正以管理员身份运行,否则可能丢失U盘内所有数据!
echo 确认U盘上无上述文件,并正以管理员身份运行脚本后请按任意键继续;
pause>nul
cls


:isthevirusexist
if exist %vol%\autorun.inf (
	goto 1
) else (
	echo 你的U盘TM压根就不存在病毒,自作多情!
	echo 正在恢复隐藏文件夹...按任意键继续
	pause>nul
	attrib %vol%\* /D /S -S -H
	cls
	echo 按任意键退出吧,孩纸!
	pause>nul
	exit
)
:1
echo 请稍等,正在以方案1清除该U盘内的假文件夹病毒和autorun病毒...
del %vol%\*.exe /F /S /Q
del %vol%\autorun.inf /F /S /Q
del %vol%\*.vbs /F /S /Q
del %vol%\*.db /F /S /Q
del %vol%\*.lnk /F /S /Q
attrib %vol%\* /D /S -S -H
:2
if exist %vol%\autorun.inf (
	echo 方案1清除病毒失败!
	echo 你的Autorun病毒自我提权至System,无法通过前面的方式删除
	echo 莫慌,下面这种方法成功率99%
	echo 杀除需要的时间受U盘内文件大小以及U盘速度影响
	echo 过程中严禁拔出U盘，否则会丢失U盘内所有数据!
	echo 预计需要比杀除假文件夹病毒更长的时间,坐和放宽
	pause
	cls
	
	echo autorun.inf > C:\Exclusion.txt
	echo .exe >> C:\Exclusion.txt
	echo .vbs >> C:\Exclusion.txt
	echo .db >> C:\Exclusion.txt
	echo .lnk >> C:\Exclusion.txt
	xcopy "%vol%\*" "C:\udsktmp" /E /I /Y /EXCLUDE:C:\Exclusion.txt
	format %vol% /Q /Y
	xcopy "C:\udsktmp\*" "%vol%" /E /I /Y
	attrib %vol%\* /D /S -S -H
	rmdir /S /Q C:\udsktmp
	del C:\Exclusion.txt /Q
	:failed
	if exist %vol%\autorun.inf (
		echo 什么?这样也杀不掉毒?
		echo 再检查下是否获取了管理员权限,实在不行的话进PE再试吧!
		pause>nul
		exit
	) else (
		cls
		echo 恭喜你,方案2清除病毒成功!
		echo 下次注意不要把U盘乱♂插♂进安全性不明的电脑上就好了~
		echo 按任意键退出吧!
		pause>nul
		exit
	)
) else (
	cls
	echo 恭喜你,方案1清除病毒成功!
	echo 下次注意不要把U盘乱♂插♂进安全性不明的电脑上就好了~
	echo 按任意键退出吧!
	pause>nul
	exit
)