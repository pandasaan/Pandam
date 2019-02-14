require 'test_helper'

class Admin::ShipmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_shipments_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_shipments_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_shipments_update_url
    assert_response :success
  end

end
