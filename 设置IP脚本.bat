@rem auther: jiangbingbin
@rem date: 2016-07-06
@rem charset: gbk
@rem desc: ����IP�ӿ���Ϣ��ýӿڱ���,����WLAN���Ǳ���;���ű���Ҫʹ�ù���ԱȨ��ִ��

@echo off  
title --IP�Զ����� --   
MODE con: COLS=80 lines=30  
color 0a

echo ����IP��ַ��Ϣ
netsh interface ip show addresses

@set /p ipinter=���������ӱ�����
if "%ipinter%"=="" set ipinter=������������
echo Ĭ�Ͻӿ�Ϊ: %ipinter%

@set /p choice=��ѡ��[�󶼻�����,��1;��̬��ַ,��2]��

if "%choice%"=="1" goto ip1
if "%choice%"=="2" goto ip2

:ip1
@rem ��̬IP��ַ
netsh interface ip set address "%ipinter%" static 10.165.48.214 255.255.255.0 10.165.48.1 0
netsh interface ip set dns "%ipinter%" static 10.164.5.2 PRIMARY
goto end

:ip2
@rem ��̬��ַ
netsh interface ip set address "%ipinter%" dhcp
netsh interface ip set dns "%ipinter%" dhcp
goto end

:end
@echo ������ϣ�  
rem exit 

pause