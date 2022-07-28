require "test_helper"

class Admin::OrderedItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admin_ordered_items_update_url
    assert_response :success
  end
end
