SPI=$(lsmod | grep spi_)

grep -qxF 'dtparam=spi=on' /boot/config.txt || sudo echo "dtparam=spi=on" >> /boot/config.txt

if [ -z "$SPI" ]
then
	echo "SPI is not enabled. Entry is added in /boot/config.txt. Reboot to enable(sudo reboot)"
else
	SRC_PATH=$(pwd)
	sudo apt-get update -y
	sudo apt-get upgrade -y
	sudo apt-get install -y python3-dev python3-spidev
	cd ~
	git clone https://github.com/Gadgetoid/py-spidev.git
	cd py-spidev
	sudo python setup.py install
fi
