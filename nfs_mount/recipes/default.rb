directory "/testj" do
  owner 'root'
  group 'root'
  mode '0777'
  action :create
end

file "/testj/1" do
  content node["deploy"]["moodle"]["memcached"]["host"]
  mode '0777'
  owner 'root'
  group 'root'
end

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
  #device node[:opsworks][:layers][:memcached][:instances][0] + ":/vol/moodledata"
  device node["deploy"]["appshortname"]["memcached"]["host"] + ":/vol/moodledata"
  device "memcached1:/vol/moodledata"
  fstype "nfs"
  options "rw"
  # action [:mount, :enable] # uncommenting this will force unmount+remount
end
