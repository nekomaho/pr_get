require "bundler/setup"
require "pr_get"
require 'pry'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  Dir.glob(File.join(File.dirname(__FILE__), "../lib/pr_get/**/*.rb")).each { |f| require f }
end
