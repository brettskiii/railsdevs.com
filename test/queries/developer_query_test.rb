require "test_helper"

class DeveloperQueryTest < ActiveSupport::TestCase
  test "developers are most recently added first" do
    query = DeveloperQuery.new
    assert_equal query.records, 2
    assert_equal Developer.count, 4
  end
end
