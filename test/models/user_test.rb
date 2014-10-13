require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def check_field_is_required

  test "user's name is required when signing up"
    check_field_is_required(:name, "Frank")
  end

  test "email address is required when signing up"
    check_field_is_required(:email, "frank@frank.com")
  end

  test "password is required when signing up"
    check_field_is_required(:password, "frankspassword")
  end

  # test "the truth" do
  #   assert true
  # end
end
