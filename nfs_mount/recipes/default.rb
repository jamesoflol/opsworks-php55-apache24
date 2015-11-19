# execute "mkdir -p /mnt/nfs/moodledata"
# execute "mount memcached1:/moodledata /mnt/nfs/moodledata"
# execute "sudo chown deploy:apache /mnt/nfs/moodledata"
# execute "sudo chmod 775 /mnt/nfs/moodledata"

directory "/mnt/nfs" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory "/mnt/nfs/moodledata" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

mount "/mnt/nfs/moodledata" do
  device "memcached1:/vol/moodledata"
  fstype "nfs"
  options "rw"
  # action [:mount, :enable] # uncommenting this will force unmount+remount
end
