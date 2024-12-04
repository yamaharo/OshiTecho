require "test_helper"

class MasterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get master_index_url
    assert_response :success
  end

  test "should get show" do
    get master_show_url
    assert_response :success
  end

  test "should get form" do
    get master_form_url
    assert_response :success
  end
end
