@echo off
color 2f
cls

echo ----------Xtec U盘病毒清除工具 v1.2----------
echo 推荐在PE环境下运行本工具以在短时间内清除autorun病毒
echo 如果是正常系统,请确保该系统没有染上U盘内的病毒
echo 并正以管理员身份运行此脚本!
echo 请按任意键继续，否则直接关闭窗口吧!
pause>nul
cls

echo 请输入染毒U盘的盘符(可在"我的电脑"里面看到)然后回车
echo 例如 G:
set /p vol=

cls
color 2c
echo 最后请备份好U盘上所有EXE和VBS文件,继续执行操作会删除U盘根目录上所有EXE和VBS文件!
echo 请再次确认该脚本正以管理员身份运行,否则可能丢失U盘内所有数据!
echo 确认U盘上无上述文件,并正以管理员身份运行脚本后请按任意键继续;
pause>nul
color 2f
cls
echo 请稍等,正在以标准方案清除该U盘内的假文件夹病毒和autorun病毒...

del %vol%\*.exe /F /Q
del %vol%\autorun.inf /F /Q
del %vol%\*.vbs /F /Q
attrib %vol%\* /D /S -S -H

if exist %vol%\autorun.inf (
	echo 以标准方案清除病毒失败!
	echo 你的U盘染上了第二代autorun病毒,准备以备用方案进行杀除...
	echo 杀除需要的时间受U盘内文件大小以及U盘速度影响
	echo 过程中严禁拔出U盘，否则会丢失U盘内所有数据!
	echo 预计需要比杀除假文件夹病毒更长的时间,坐和放宽(Win10预览版的一个翻译错误)
	pause
	cls
	
	echo autorun.inf > C:\Exclusion.txt
	echo .exe >> C:\Exclusion.txt
	echo .vbs >> C:\Exclusion.txt
	xcopy "%vol%\*" "C:\udsktmp" /E /I /Y /EXCLUDE:C:\Exclusion.txt
	format %vol% /Q /Y
	xcopy "C:\udsktmp\*" "%vol%" /E /I /Y
	del C:\udsktmp /Q
	del C:\Exclusion.txt /Q
	
	cls
	echo 恭喜你,备用方案清除病毒成功!
	echo 下次注意不要把U盘乱♂插♂进打印店的电脑上就好了~
	echo 按任意键退出吧!
	pause>nul
) else (
	cls
	echo 恭喜你,标准方案清除病毒成功!
	echo 下次注意不要把U盘乱♂插♂进打印店的电脑上就好了~
	echo 按任意键退出吧!
	pause>nul
)