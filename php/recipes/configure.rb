node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'php'
    Chef::Log.debug("Skipping deploy::php application #{application} as it is not an PHP app")
    next
  end

  # find the first working instance of memcached layer - memcahced server also hosting nfs share
  memcached_ip = ""
  node["opsworks"]["layers"]["memcached"]["instances"].each do |x,memcached_instance|
    if memcached_instance["status"] == "online"
      memcached_ip = memcached_instance["ip"]
      break
    end
  end

  # write out opsworks.php
  template "#{deploy[:deploy_to]}/shared/config/opsworks.php" do
    cookbook 'php'
    source 'opsworks.php.erb'
    mode '0660'
    owner deploy[:user]
    group deploy[:group]
    variables(
      :database => deploy[:database],
      :memcached => { "host" => memcached_ip, deploy[:memcached][:port] },
      :layers => node[:opsworks][:layers],
      :stack_name => node[:opsworks][:stack][:name]
    )
    only_if do
      File.exists?("#{deploy[:deploy_to]}/shared/config")
    end
  end
end
