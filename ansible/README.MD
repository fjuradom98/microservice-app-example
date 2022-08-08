# Ansible

This folder contain the ansible scripts to configure the EC2 instances for the RamUp

- The inventory will help you configure the Hosts with the key that is needed to enter to that instance and also the IP adress of the instance.
- The vars file, has the variables of the IP adresses of the HOST.
- Finally the docker file, will download docker in each instance and connect to each machine individually to pull the corresponding image and run it with the parameters that are expected for them.
