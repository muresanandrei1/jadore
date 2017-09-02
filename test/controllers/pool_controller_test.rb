require 'test_helper'

class PoolControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pool_index_url
    assert_response :success
  end

end
