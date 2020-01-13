# rak_common_for_gateway

##	Introduction 

The aim of this project is to help users set up a LoRa network easily. The User Guide can be get from our Web.

##	Supported platforms

This project currently provides support for the below platforms.
* RAK831
* RAK833(USB/SPI)
* RAK2245
* RAK2247(USB/SPI)
* RAK7243

##	Changelog
2019-12-17 V4.1.1
* Added support for rak2247/rak833 spi version.

2019-12-02
* Fix a bug. There is a mistake word "diable" in rak/gateway-config script, line 272, it should be do_ChirpStack disable.

2019-11-19 V4.1.0
* 1.LoRaServer changed its name to ChirpStack.
* 2.ChirpStack turns off ADR by default.
* 3.Unconfigure the ip of eth0 to 192.168.10.10.
* 4.Users can change the gateway_id in local_conf.json.
* 5.Increase i2c rate for rak7243.
* 6.Install chirpstack only on Raspberry Pi 3 and Raspberry Pi 4. Pi zero can't run ChirpStack.
* 7.In the AP mode, the gateway IP address is 192.168.230.1.

2019-09-19 V4.0.0
* Use lan0's mac address when eth0 does not exist.

2019-05-24 V2.9

* 1.Multiple models are integrated with one common version.
* 2.Upgrade LoRa server to 3.0.

##	Installation procedure

step1 : Download and install [Raspbian Stretch or Buster LITE](https://www.raspberrypi.org/downloads/raspbian/) 

step2 : Use "sudo raspi-config" command, enable spi and i2c interface.

step3 : Clone the installer and start the installation.

      $ sudo apt update; sudo apt install git -y
      $ git clone https://github.com/RAKWireless/rak_common_for_gateway.git ~/rak_common_for_gateway
      $ cd ~/rak_common_for_gateway
      $ sudo ./install.sh

step4 : Next you will see some messages as follow. Please select the corresponding hardware model.

      Please select your gateway model:
      *	1.RAK831
      *	2.RAK2245
      *	3.RAK7243
      *	4.RAK833(USB)
      *	5.RAK2247(USB)
      *	6.RAK2247(SPI)
      *	7.RAK833(SPI)
      Please enter 1-7 to select the model:

step5 : Wait a moment and the installation is complete.If your gateway uses a wired connection, please reconfigure the LAN's IP address using "sudo gateway-config" after the installation is complete.

step6 : For more other features, please use "sudo gateway-config".




##  Note: The following content is contributed by @x893:

For DietPi OS need add
apt install build-essential net-tools -y
in rak/install.sh (for example before apt install git ppp dialog jq minicom monit -y)
and need check hciuart enabled because
systemctl disable hciuart
not installed and script fail.
