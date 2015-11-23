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

# find the first working instance of memcached layer - memcahced server also hosting nfs share
# memcached_ip = ""
# node["opsworks"]["layers"]["memcached"]["instances"].each do |x,memcached_instance|
#   if memcached_instance["status"] == "online"
#     memcached_ip = memcached_instance["ip"]
#     break
#   end
# end

mount "/mnt/nfs/moodledata" do
  # device memcached_ip + ":/vol/moodledata"
  device node["deploy"]["moodle"]["memcached"]["host"] + ":/vol/moodledata"
  fstype "nfs"
  options "rw"
  # action [:mount, :enable] # uncommenting this will force unmount+remount
end
