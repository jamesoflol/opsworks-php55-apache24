  # chef recipe here

include_recipe "nfs"

nfs_export "/vol/moodledata" do
  network '*'
  writeable true
  sync true
  options ['no_root_squash','no_subtree_check']
end
