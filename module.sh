if [ "${@:-}" != "" ]
then
device=${@:-}
fi

read -p '╚═(options)>' userinput1;
#
if [ "${userinput1:-}" != "2" ] && [ "${device:-}" = "" ] && [ "${userinput1:-}" != "99" ] && [ "${userinput1:-}" != "0" ]
then
	echo -e "connected device not found!"
	bash module.sh ${@:-}

fi
if [ "${userinput1:-}" = "1" ]
then
	adb  devices
fi
if [ "${userinput1:-}" = "2" ]
then
	echo -e "Note! Only android";
	read -p '╚═(İp)>' device;
#
	adb connect ${device:-}
	device=${device:-}
	if [ "${device:-}" = "" ]
	then
		bash module.sh
		exit
	fi

fi
if [ "${userinput1:-}" = "3" ]
then
	adb disconnect ${device:-}
fi
if [ "${userinput1:-}" = "4" ]
then
	adb kill-server
	adb tcpip 5555
fi
if [ "${userinput1:-}" = "5" ]
then
	adb -s ${device:-} shell
fi
if [ "${userinput1:-}" = "6" ]
then
	adb -s ${device:-} shell screencap /sdcard/screencap.png
	read -p '╚═(save path)>' svpath;
#
	adb -s ${device:-} pull /sdcard/screencap.png ${svpath:-}
	adb -s ${device:-} shell rm /sdcard/screencap.png
fi
if [ "${userinput1:-}" = "7" ]
then
	adb -s ${device:-} shell screenrecord /sdcard/screenrec.mp4
        read -p '╚═(save path)>' svpath;
#
        adb -s ${device:-} pull /sdcard/screenrec.mp4 ${svpath:-}
        adb -s ${device:-} shell rm /sdcard/screenrec.mp4
fi
if [ "${userinput1:-}" = "8" ]
then
        read -p '╚═(pull path)>' plpath;
#
	read -p '╚═(save path)>' svpath;
#
	adb -s ${device:-} pull ${plpath:-} ${svpath:-}
fi
if [ "${userinput1:-}" = "9" ]
then
        read -p '╚═(push path)>' pspath;
#
        read -p '╚═(target path)>' tgpath;
#
        adb -s ${device:-} push ${pspath:-} ${tgpath:-}
fi
if [ "${userinput1:-}" = "10" ]
then
	adb -s ${device:-} shell reboot
fi
if [ "${userinput1:-}" = "11" ]
then
	read -p '╚═(apk path)>' apkpath;
#
        adb -s ${device:-} install ${apkpath:-}
fi
if [ "${userinput1:-}" = "12" ]
then
        read -p '╚═(package eg. com.termux)>' package;
#
        adb -s ${device:-} install ${package:-}
fi
if [ "${userinput1:-}" = "99" ]
then
	exit
	adb kill-server
fi
if [ "${userinput1:-}" = "0" ]
then
	clear
	bash start.sh ${device:-}
fi
if [ "${userinput1:-}" != "99" ]
then
	exit
fi
