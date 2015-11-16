execute "mkdir -p /mnt/nfs/moodledata" do
  ignore_failure true
end
execute "mount memcached1:/moodledata /mnt/nfs/moodledata" do
  ignore_failure true
end
execute "sudo chown deploy:apache /mnt/nfs/moodledata" do
  ignore_failure true
end
execute "sudo chmod 775 /mnt/nfs/moodledata" do
  ignore_failure true
end
