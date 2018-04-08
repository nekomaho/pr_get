require 'pry'
require 'github_api'

class Search
  attr_reader :search_result

  def initialize(github, query)
    @search_results ||= github.search.issues query
  end

  def urls
    @search_results.body.items.map{ |result| result.html_url }
  end
end

user = ARGV[0]
repo = ARGV[1]
commit_sha = ARGV[2]

git = Github.new user: user, repo: repo, oauth_token: ENV['GIT_HUB_AUTH_TOKEN']
puts Search.new(git, commit_sha).urls.each {|result| '#{result}\n'}
