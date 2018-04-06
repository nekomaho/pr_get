require 'pry'
require 'github_api'

github = Github.new

p github.repos.list user: 'nekomaho'
