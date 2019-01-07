#
#		Tidy up
#
rm boot.img ../files/*.img 
#
#		Build the bootloader
#
pushd ../bootloader
sh build.sh
popd
#
#		Build the vocabulary file.
#
pushd ../vocabulary
sh build.sh
popd
#
#		Assemble the kernel
#
zasm -buw kernel.asm -o boot.img -l boot.lst
#
#		Insert vocabulary into the image file.
#
if [ -e boot.img ]
then
	cp boot.img ../files/boot_clean.img
fi
