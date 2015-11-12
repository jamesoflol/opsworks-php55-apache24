execute "mkdir -p /mnt/nfs/moodledata"
execute "mount memcached1:/moodledata /mnt/nfs/moodledata"
execute "sudo chown deploy:apache /mnt/nfs/moodledata"
execute "sudo chmod 775 /mnt/nfs/moodledata"
