# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.6"

Vagrant.configure("2") do |config|
  config.vm.box = "coreos-alpha"
  config.vm.box_url = "http://alpha.release.core-os.net/amd64-usr/current/coreos_production_vagrant.json"

  # CoreOS doesn't like these features to be enabled.
  config.vm.provider "virtualbox" do |v|
    v.check_guest_additions = false
    v.functional_vboxsf = false
  end

  config.vm.define "core" do |core|
    core.vm.hostname = "scraper"

    core.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end

    core.vm.network :private_network, ip: "172.17.8.100"

    [5432, 6379, 8000, 8080].each do |port|
      core.vm.network "forwarded_port", guest: port, host: port
    end

    # Disable because this will not get used.
    core.vm.synced_folder ".", "/vagrant", disabled: true

    # Mounting $HOME allows the Docker volume mounts to work as if the
    # Docker service were running natively on the virtual machine host.
    core.vm.synced_folder ENV["HOME"], ENV["HOME"], type: "nfs", mount_options: ["nolock,vers=3,udp"]

    # Place the cloud-config file in a place where CoreOS knows to execute it.
    core.vm.provision "file", source: "cloud-config/core.yml", destination: "/tmp/vagrantfile-user-data"
    core.vm.provision "shell", inline: "mv /tmp/vagrantfile-user-data /var/lib/coreos-vagrant/", privileged: true
  end
end
