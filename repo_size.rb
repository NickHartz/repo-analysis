#!/usr/bin/env ruby

require "json"
require 'github_api'

# You can create a toke on https://github.com/settings/applications 'Generate new token'
token = '4d21509870a2ec41f96e4f085b71739192221a92'

github = Github.new :oauth_token => token, auto_pagination: true

github.orgs.list[0]["login"]

github.repos.list( org: 'Mincom' ).count

github.orgs.list.each do |org|
  # print "#{org['login']} \n"
  github.repos.list( org: org['login'] ).each do |repo|
    printf "#{repo['full_name']} : #{repo['size']} \n"
  end
end

