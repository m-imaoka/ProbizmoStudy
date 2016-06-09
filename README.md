# ProbizmoStudy

## Getting Started

1. Install Vagrant to your host OS.

  https://www.vagrantup.com/

2. Install vagrant-vbguest plugin.
  ```
  vagrant plugin install vagrant-vbguest
  ```
3. Clone this project.

  ```
  git clone https://github.com/m-imaoka/ProbizmoStudy.git
  ```

4. Move current directory to ProbizmoStudy.

  ```
  cd [ProbizmoStudy's path]
  ```
5. Run Vagrant.

  ```
  vagrant up
  ```
6. Reinstall virtualbox guest additions. (optional)

    Insert VBoxGuestAdditions.iso into CD/DVD storage.

  ```
  vagrant ssh
  sudo mount /dev/cdrom /mnt
  sudo /mnt/VBoxLinuxAdditions.run
  exit
  vagrant reload
  ```
7. Provision virtual machine.

  ```
  vagrant provision
  ```
8. Login virtual machine.

  ```
  vagrant ssh
  ```
