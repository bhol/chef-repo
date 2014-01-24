# cookbooks/users/recipes/groups.rb

search(:groups, "*:*").each do |group_data|
  group group_data['id'] do
    gid group_data['gid']
    members group_data['members']
  end
end