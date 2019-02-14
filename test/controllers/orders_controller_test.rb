require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get orders_new_url
    assert_response :success
  end

  test "should get create" do
    get orders_create_url
    assert_response :success
  end

  test "should get show" do
    get orders_show_url
    assert_response :success
  end

  test "should get index" do
    get orders_index_url
    assert_response :success
  end

  test "should get result" do
    get orders_result_url
    assert_response :success
  end

  test "should get flg_update" do
    get orders_flg_update_url
    assert_response :success
  end

  test "should get item_flg_update" do
    get orders_item_flg_update_url
    assert_response :success
  end

end
