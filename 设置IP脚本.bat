@rem auther: jiangbingbin
@rem date: 2016-07-06
@rem charset: gbk
@rem desc: 根据IP接口信息获得接口别名,下面WLAN就是别名;本脚本需要使用管理员权限执行

@echo off  
title --IP自动设置 --   
MODE con: COLS=80 lines=30  
color 0a

echo 本地IP地址信息
netsh interface ip show addresses

@set /p ipinter=请输入连接别名：
if "%ipinter%"=="" set ipinter=无线网络连接
echo 默认接口为: %ipinter%

@set /p choice=请选择[大都会内线,按1;动态地址,按2]：

if "%choice%"=="1" goto ip1
if "%choice%"=="2" goto ip2

:ip1
@rem 静态IP地址
netsh interface ip set address "%ipinter%" static 10.165.48.214 255.255.255.0 10.165.48.1 0
netsh interface ip set dns "%ipinter%" static 10.164.5.2 PRIMARY
goto end

:ip2
@rem 动态地址
netsh interface ip set address "%ipinter%" dhcp
netsh interface ip set dns "%ipinter%" dhcp
goto end

:end
@echo 设置完毕！  
rem exit 

pause