@echo off
color 2f
cls

echo ----------Xtec U�̲���������� v1.2----------
echo �Ƽ���PE���������б��������ڶ�ʱ�������autorun����
echo ���������ϵͳ,��ȷ����ϵͳû��Ⱦ��U���ڵĲ���
echo �����Թ���Ա������д˽ű�!
echo �밴���������������ֱ�ӹرմ��ڰ�!
pause>nul
cls

echo ������Ⱦ��U�̵��̷�(����"�ҵĵ���"���濴��)Ȼ��س�
echo ���� G:
set /p vol=

cls
color 2c
echo ����뱸�ݺ�U��������EXE��VBS�ļ�,����ִ�в�����ɾ��U�̸�Ŀ¼������EXE��VBS�ļ�!
echo ���ٴ�ȷ�ϸýű����Թ���Ա�������,������ܶ�ʧU������������!
echo ȷ��U�����������ļ�,�����Թ���Ա������нű����밴���������;
pause>nul
color 2f
cls
echo ���Ե�,�����Ա�׼���������U���ڵļ��ļ��в�����autorun����...

del %vol%\*.exe /F /Q
del %vol%\autorun.inf /F /Q
del %vol%\*.vbs /F /Q
attrib %vol%\* /D /S -S -H

if exist %vol%\autorun.inf (
	echo �Ա�׼�����������ʧ��!
	echo ���U��Ⱦ���˵ڶ���autorun����,׼���Ա��÷�������ɱ��...
	echo ɱ����Ҫ��ʱ����U�����ļ���С�Լ�U���ٶ�Ӱ��
	echo �������Ͻ��γ�U�̣�����ᶪʧU������������!
	echo Ԥ����Ҫ��ɱ�����ļ��в���������ʱ��,���ͷſ�(Win10Ԥ�����һ���������)
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
	echo ��ϲ��,���÷�����������ɹ�!
	echo �´�ע�ⲻҪ��U���ҡ������ӡ��ĵ����Ͼͺ���~
	echo ��������˳���!
	pause>nul
) else (
	cls
	echo ��ϲ��,��׼������������ɹ�!
	echo �´�ע�ⲻҪ��U���ҡ������ӡ��ĵ����Ͼͺ���~
	echo ��������˳���!
	pause>nul
)