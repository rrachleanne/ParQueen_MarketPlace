require 'test_helper'

class ListingControllerTest < ActionDispatch::IntegrationTest
  test "should get page" do
    get listing_page_url
    assert_response :success
  end

end
