require 'github_api'
require_relative 'search_item'
require_relative 'item_result'

module PrGet
  class Client
    def initialize(**args)
      @github = Github.new user: args[:user], repo: args[:repo], oauth_token: args[:oauth_token]
    end

    def search(**search_key)
      search_key[:sort_key] ||= :number
      items = SearchItem.new(@github, search_key[:sha]).exec.sort_by {|item| item.send(search_key[:sort_key]) }
      items.map do |item|
        ItemResult.new(item)
      end
    end
  end
end
