require "pr_get/version"
require "pr_get/client"

module PrGet
  class << self
    def new(**args)
      Client.new(args)
    end
  end
end
