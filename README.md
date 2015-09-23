Vagrant Environment for DC Sensors Webapp
========================


Install
=======

1. Install vagrant >= 1.6.5 (http://www.vagrantup.com/downloads.html) 
2. Install the necessary plugins for vagrant:
    ```vagrant plugin install vagrant-hostmaster
    vagrant plugin install vagrant-cachier```
3. Clone the webapp [DC-Sensor|https://github.com/SLACNationalAcceleratorLaboratory/DC-Sensors] into `/vagrant/DC-Sensors`. This vagrant recipe will replicate this directory contents into the virtual machine for development.
    ```mkdir /vagrant
    sudo chown me:mine /vagrant
    cd /vagrant
    git clone https://github.com/SLACNationalAcceleratorLaboratory/DC-Sensors```
4. Clone the vagrant repo somewhere (e.g. Desktop/Development):
    ```git clone https://github.com/SLACNationalAcceleratorLaboratory/itsq-centos7-vagrant```
5. Change directory into `itsq-cent0s7-vagrant`
6. Run the command
    ```vagrant up```
7. Enjoy writing code

