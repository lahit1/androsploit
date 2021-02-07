
showkeysmenu() {
clear
echo -e "[  0] KEYCODE_0
1 -->  KEYCODE_SOFT_LEFT
2 --> KEYCODE_SOFT_RIGHT
3 --> KEYCODE_HOME
4--> KEYCODE_BACK
5 --> KEYCODE_CALL
6 --> KEYCODE_ENDCALL
7 --> KEYCODE_0
8 --> KEYCODE_1
9 --> KEYCODE_2
10 --> KEYCODE_3
11 --> KEYCODE_4
12 --> KEYCODE_5
13 --> KEYCODE_6
14 --> KEYCODE_7
15 --> KEYCODE_8
16 --> KEYCODE_9
17 --> KEYCODE_STAR
18 --> KEYCODE_POUND
19 --> KEYCODE_DPAD_UP
20 --> KEYCODE_DPAD_DOWN
21 --> KEYCODE_DPAD_LEFT
22 --> KEYCODE_DPAD_RIGHT
23 --> KEYCODE_DPAD_CENTER
24 --> KEYCODE_VOLUME_UP
25 --> KEYCODE_VOLUME_DOWN
26 --> KEYCODE_POWER
27 --> KEYCODE_CAMERA
28 --> KEYCODE_CLEAR
29 --> KEYCODE_A
30 --> KEYCODE_B
31 --> KEYCODE_C
32 --> KEYCODE_D
33 --> KEYCODE_E
34 --> KEYCODE_F
35 --> KEYCODE_G
36 --> KEYCODE_H
37 --> KEYCODE_I
38 --> KEYCODE_J
39 --> KEYCODE_K
40 --> KEYCODE_L
41 --> KEYCODE_M
42 --> KEYCODE_N
43 --> KEYCODE_O
44 --> KEYCODE_P
45 --> KEYCODE_Q
46 --> KEYCODE_R
47 --> KEYCODE_S
48 --> KEYCODE_T
49 --> KEYCODE_U
50 --> KEYCODE_V
51 --> KEYCODE_W
52 --> KEYCODE_X
53 --> KEYCODE_Y
54 --> KEYCODE_Z
55 --> KEYCODE_COMMA
56 --> KEYCODE_PERIOD
57 --> KEYCODE_ALT_LEFT
58 --> KEYCODE_ALT_RIGHT
59 --> KEYCODE_SHIFT_LEFT
60 --> KEYCODE_SHIFT_RIGHT
61 --> KEYCODE_TAB
62 --> KEYCODE_SPACE
63 --> KEYCODE_SYM
64 --> KEYCODE_EXPLORER
65 --> KEYCODE_ENVELOPE
66 --> KEYCODE_ENTER
67 --> KEYCODE_DEL
68 --> KEYCODE_GRAVE
69 --> KEYCODE_MINUS
70 --> KEYCODE_EQUALS
71 --> KEYCODE_LEFT_BRACKET
72 --> KEYCODE_RIGHT_BRACKET
73 --> KEYCODE_BACKSLASH
74 --> KEYCODE_SEMICOLON
75 --> KEYCODE_APOSTROPHE
76 --> KEYCODE_SLASH
77 --> KEYCODE_AT
78 --> KEYCODE_NUM
79 --> KEYCODE_HEADSETHOOK
80 --> KEYCODE_FOCUS
81 --> KEYCODE_PLUS
82 --> KEYCODE_MENU
83 --> KEYCODE_NOTIFICATION
84 --> KEYCODE_SEARCH
85 --> KEYCODE_MEDIA_PLAY_PAUSE
86 --> KEYCODE_MEDIA_STOP
87 --> KEYCODE_MEDIA_NEXT
88 --> KEYCODE_MEDIA_PREVIOUS
89 --> KEYCODE_MEDIA_REWIND
90 --> KEYCODE_MEDIA_FAST_FORWARD
91 --> KEYCODE_MUTE
92 --> KEYCODE_PAGE_UP
93 --> KEYCODE_PAGE_DOWN
94 --> KEYCODE_PICTSYMBOLS
...
122 -->  KEYCODE_MOVE_HOME
123 -->  KEYCODE_MOVE_END
"
}

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
	echo -e "wait 3m record";
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
	echo -e "[ 1] power settings
[ 2] mobile data on/off
[ 3] wifi on/off
[ 4] usb functions
[ 5] nfc on/off
"
	read -p '╚═(option)>' opt;
	if [ "${opt:-}" = "1" ]
	then
		echo -e "[ 1] screen stayon true
[ 2] screen tayon false
[ 3] reboot
[ 4] power off
"
		read -p '╚═(option)>' opt2;
		if [ "${opt2:-}" = "1" ]
        	then
			adb -s ${device:-} shell su svc power stayon true
        	fi
                if [ "${opt2:-}" = "2" ]
                then
                        adb -s ${device:-} shell su svc power stayon false
                fi
		if [ "${opt2:-}" = "3" ]
                then
                        adb -s ${device:-} shell su svc power reboot
                fi
		if [ "${opt2:-}" = "4" ]
                then
                        adb -s ${device:-} shell su svc power shutdown
                fi
	fi
	if [ "${opt:-}" = "2" ]
        then
		echo -e "[ 1] enable
[ 2] disable
"
		read -p '╚═(option)>' opt2;
		if [ "${opt2:-}" = "1" ]
                then
                        adb -s ${device:-} shell su svc data enable
                fi
		if [ "${opt2:-}" = "2" ]
                then
                        adb -s ${device:-} shell su svc data disable
                fi
        fi
	if [ "${opt:-}" = "3" ]
        then
		echo -e "[ 1] enable
[ 2] disable
"
                read -p '╚═(option)>' opt2;
                if [ "${opt2:-}" = "1" ]
                then
                        adb -s ${device:-} shell su svc wifi enable
                fi
                if [ "${opt2:-}" = "2" ]
                then
                        adb -s ${device:-} shell su svc wifi disable
                fi
        fi
	if [ "${opt:-}" = "4" ]
        then
		echo -e "[ 1] show functions
[ 2] set function
"
		read -p '╚═(option)>' opt;
		if [ "${opt:-}" = 1 ]
		then
			adb -s ${device:-} shell su svc usb getFunction
		fi
		if [ "${opt:-}" = 1 ]
                then
			read -p '╚═(function)>' func;
                        adb -s ${device:-} shell su svc usb setFunction ${func:-}
                fi
        fi
	if [ "${opt:-}" = "5" ]
        then
		echo -e "[ 1] enable
[ 2] disable
"
                read -p '╚═(option)>' opt2;
                if [ "${opt2:-}" = "1" ]
                then
                        adb -s ${device:-} shell su svc nfc enable
                fi
                if [ "${opt2:-}" = "2" ]
                then
                        adb -s ${device:-} shell su svc nfc disable
                fi
        fi
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
        adb -s ${device:-} uninstall ${package:-}
fi
if [ "${userinput1:-}" = "13" ]
then
	read -p '╚═(message)>' message;
	adb -s ${device:-} shell am start -a android.intent.action.SENDTO -d sms:CCXXXXXXXXXX --es sms_body "${message:-}" --ez exit_on_sent true
	adb -s ${device:-} shell input keyevent 22
	adb -s ${device:-} shell input keyevent 66
fi
if [ "${userinput1:-}" = "14" ]
then
	echo -e "[ 1] text
[ 2]keyevent"
        read -p '╚═══(option)>' opt;
	if [ "${opt:-}" = "1" ]
	then
		read -p '╚════(text)>' text;
		adb -s ${device:-} input text ${text:-}
	fi
	if [ "${opt:-}" = "2" ]
        then
		showkeysmenu
		echo
                read -p '╚════(option)>' number;
                adb -s ${device:-} input keyevent ${number:-}
        fi
fi
if [ "${userinput1:-}" = "15" ]
then
	read -p '╚═══(save path)>' svpath>
        adb -s ${device:-} pull /data/misc/wifi/wpa_supplicant.conf ${svpath:-}
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
