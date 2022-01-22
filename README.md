# Inventory-management
# Before run ansible-playbook command at first you shoud install needed packages using\
# bellow comands. Run this command on the ansible host

sudo apt install python3-jinja2 python3-crypto python3-distutils python3-dnspython python3-httplib2 python3-netaddr python3-argcomplete python3-jmespath python3-kerberos python3-libcloud python3-selinux python3-winrm python3-xmltodict -y

# Download ansible manually and install it using this command
sudo apt install ./ansible_2.9.6+dfsg-1_all.deb

# Install snmp dependencies packages
sudo apt install python-pysnmp4 python-pysnmp4-apps python-pysnmp4-doc -y


# Insert bellow command in crontab to automate ansible running

*/50 * * * *    if ! out=`ansible-playbook -i /opt/inventory-engine/ansible/inventory/cloud.inventory /opt/inventory-engine/ansible/build_inventory.yml`; then echo $out; fi
