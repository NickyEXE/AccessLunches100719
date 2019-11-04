require 'test_helper'

class RailsControllerTest < ActionDispatch::IntegrationTest
  test "should get d" do
    get rails_d_url
    assert_response :success
  end

  test "should get model" do
    get rails_model_url
    assert_response :success
  end

  test "should get user" do
    get rails_user_url
    assert_response :success
  end

end
