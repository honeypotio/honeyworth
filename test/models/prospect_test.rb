require 'test_helper'

class ProspectTest < ActiveSupport::TestCase
  def setup
    @prospect = Prospect.new(email: "test@example.com", profile_link: "https://www.linkedin.com/in/linustorvalds", 
                             dev_link: "https://github.com/torvalds")
  end

  test "should accept valid submission" do
    assert @prospect.valid?
  end

  test "email should be present" do
    @prospect.email = "   "
    assert_not @prospect.valid?
  end

  test "email should not be too long" do
    @prospect.email = "denis" * 50 + "@example.com"
    assert_not @prospect.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                                 first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @prospect.email = valid_address
      assert @prospect.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                                   foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @prospect.email = invalid_address
      assert_not @prospect.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
end
