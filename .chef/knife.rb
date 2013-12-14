# See http://docs.opscode.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "bhol"
client_key               "#{current_dir}/bhol.pem"
validation_client_name   "bhol-chef-training-validator"
validation_key           "#{current_dir}/bhol-chef-training-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/bhol-chef-training"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
knife[:aws_access_key_id] = "#{ENV['AWS_ACCESS_KEY_ID']}"
knife[:aws_secret_access_key] = "#{ENV['AWS_SECRET_ACCESS_KEY']}"
knife[:aws_ssh_key_id] = "#{ENV['AWS_SSH_KEY_ID']}"
knife[:region] = "us-east-1"