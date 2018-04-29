class ItemResult
  def initialize(item)
    @item = item
  end

  def number
    @item.number
  end

  def url
    @item.html_url
  end

  def title
    @item.title
  end
end
