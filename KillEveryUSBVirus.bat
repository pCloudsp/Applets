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
echo -------����:Tech4Every1-2333Cl VER1.3-------
echo �Ƽ���PE���������б�������ʹ�õ�һ�ַ������autorun����
echo ��ȷ����ϵͳû��Ⱦ��U���ڵĲ���
echo �밴���������������ֱ�ӹرմ��ڰ�!
pause>nul
cls

echo ������Ⱦ��U�̵��̷�(����"�ҵĵ���"���濴��)Ȼ��س�
echo ���� G:
set /p vol=

cls
echo ����뱸�ݺ�U��������EXE��VBS�ļ�,����ִ�в�����ɾ��U�̸�Ŀ¼������EXE��VBS�ļ�!
echo ���ٴ�ȷ�ϸýű����Թ���Ա�������,������ܶ�ʧU������������!
echo ȷ��U�����������ļ�,�����Թ���Ա������нű����밴���������;
pause>nul
cls


:isthevirusexist
if exist %vol%\autorun.inf (
	goto 1
) else (
	echo ���U��TMѹ���Ͳ����ڲ���,��������!
	echo ���ڻָ������ļ���...�����������
	pause>nul
	attrib %vol%\* /D /S -S -H
	cls
	echo ��������˳���,��ֽ!
	pause>nul
	exit
)
:1
echo ���Ե�,�����Է���1�����U���ڵļ��ļ��в�����autorun����...
del %vol%\*.exe /F /S /Q
del %vol%\autorun.inf /F /S /Q
del %vol%\*.vbs /F /S /Q
del %vol%\*.db /F /S /Q
del %vol%\*.lnk /F /S /Q
attrib %vol%\* /D /S -S -H
:2
if exist %vol%\autorun.inf (
	echo ����1�������ʧ��!
	echo ���Autorun����������Ȩ��System,�޷�ͨ��ǰ��ķ�ʽɾ��
	echo Ī��,�������ַ����ɹ���99%
	echo ɱ����Ҫ��ʱ����U�����ļ���С�Լ�U���ٶ�Ӱ��
	echo �������Ͻ��γ�U�̣�����ᶪʧU������������!
	echo Ԥ����Ҫ��ɱ�����ļ��в���������ʱ��,���ͷſ�
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
		echo ʲô?����Ҳɱ������?
		echo �ټ�����Ƿ��ȡ�˹���ԱȨ��,ʵ�ڲ��еĻ���PE���԰�!
		pause>nul
		exit
	) else (
		cls
		echo ��ϲ��,����2��������ɹ�!
		echo �´�ע�ⲻҪ��U���ҡ������ȫ�Բ����ĵ����Ͼͺ���~
		echo ��������˳���!
		pause>nul
		exit
	)
) else (
	cls
	echo ��ϲ��,����1��������ɹ�!
	echo �´�ע�ⲻҪ��U���ҡ������ȫ�Բ����ĵ����Ͼͺ���~
	echo ��������˳���!
	pause>nul
	exit
)