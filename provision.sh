# /bin/bash

# install ansible
yum -y install epel-release
yum -y install ansible

# provision by ansible
pushd /home/vagrant/sync/ansible
ansible-playbook -i development site.yml --connection=local
popd

echo ''
echo 'Provision Done!'
echo ''