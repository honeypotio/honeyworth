require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get legal_notice" do
    get :legal_notice
    assert_response :success
  end

end
