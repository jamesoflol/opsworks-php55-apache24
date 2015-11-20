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
  device node["deploy"]["moodle"]["memcached"]["host"] + ":/vol/moodledata"
  device "memcached1:/vol/moodledata"
  fstype "nfs"
  options "rw"
  # action [:mount, :enable] # uncommenting this will force unmount+remount
end
