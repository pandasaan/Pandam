require 'test_helper'

class ShipmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shipments_create_url
    assert_response :success
  end

  test "should get index" do
    get shipments_index_url
    assert_response :success
  end

  test "should get edit" do
    get shipments_edit_url
    assert_response :success
  end

  test "should get update" do
    get shipments_update_url
    assert_response :success
  end

  test "should get destroy" do
    get shipments_destroy_url
    assert_response :success
  end

end
