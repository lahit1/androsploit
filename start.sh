device=${@:-}
testdevice () {
if [ "${@:-}" = "" ]
then
adb tcpip 5555
read -p '╚═(ip)>' device;
adb connect ${device:-}
if [ "${device:-}" = "" ]
then
echo -e "Please enter a right adress"
testdevice
exit
fi
fi
}
echo -e "\e[31mANDROSPLOIT";
echo
echo -e "\e[31mCreated by lahit1 from Shooter Hackers Team\e[0m";
echo -e
echo -e "[ 1]show all devices
[ 2] connect new device
[ 3] disconnect from device
[ 4] restart server
[ 5] shell command line
[ 6] screen capture
[ 7] screen record
[ 8] pull file(s)
[ 9] push file(s)
[10] reboot
[11] install app from apk
[12] uninstall app with package name

[ 0] clear
[99] exit";
bash module.sh ${device:-}
