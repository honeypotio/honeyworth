require 'test_helper'

class ProspectsSubmitTest < ActionDispatch::IntegrationTest
  test "invalid prospect information" do
    get root_url
    assert_no_difference 'Prospect.count' do
      post prospects_path, prospect: { 
        email: "prosp@invalid",
        profile_link: "qwe",
        dev_link: "asdf" }
    end
    assert_template 'prospects/new'
  end

  test "valid prospect information" do
    get root_url
    assert_difference 'Prospect.count', 1 do
      post_via_redirect prospects_path, prospect: { 
        email: "user@example.com",
        profile_link: "https://www.linkedin.com/in/linustorvalds",
        dev_link: "https://github.com/torvalds" }
    end
    assert_template 'prospects/new'
    assert_not flash.empty?
  end
end
