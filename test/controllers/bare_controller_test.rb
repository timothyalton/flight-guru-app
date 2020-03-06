require 'test_helper'

class BareControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bare_index_url
    assert_response :success
  end

end
