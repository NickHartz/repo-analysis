#!/usr/bin/env ruby

require "json"
require 'github_api'
require 'yaml'

# You can create a token on https://github.com/settings/applications 'Generate new token'
config = YAML.load_file 'config/application.yml'
token = config["oauth_token"]

github = Github.new :oauth_token => token, auto_pagination: true

github.orgs.list[0]["login"]

github.repos.list( org: 'Mincom' ).count

github.orgs.list.each do |org|
  # print "#{org['login']} \n"
  github.repos.list( org: org['login'] ).each do |repo|
    printf "#{repo['full_name']} : #{repo['size']} \n"
  end
end

