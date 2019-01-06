sh build.sh
python ../scripts/m7c.py
if [ -e boot.img ]
then
	wine ../bin/CSpect.exe -zxnext -cur -brk -exit -w3 ../files/bootloader.sna 
fi


