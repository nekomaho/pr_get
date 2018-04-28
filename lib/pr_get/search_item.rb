class SearchItem
  attr_reader :search_result

  def initialize(github, query)
    @github = github
    @query = query
  end

  def exec
    @github.search.issues(@query).body.items
  end
end
