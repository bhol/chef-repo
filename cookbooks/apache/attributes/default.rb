# cookbooks/apache/attributes/default.rb
default['apache']['sites']['clowns'] = { "port" => 80 }
default['apache']['sites']['bears'] = { "port" => 81 }
default['apache']['sites']['horses'] = { "port" => 85 }

# {
#   "apache" : {
#     "sites" : {
#       "clowns" : {
#         "port" : 80
#       },
#       "bears" : {
#         "port" : 81
#       }
#     }
# }
