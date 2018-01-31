require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(firstname:"Example", lastname: "User", email: "example@example.com", birthday: Date.today)
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "names should be present" do
    @user.firstname=""
    @user.lastname=""
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email=""
    assert_not @user.valid?
  end
  
  test "birthday should be present" do
    @user.birthday =""
    assert_not @user.valid?
  end
  
  test "email should be unique" do
    duplicateUser = @user.dup
    @user.save
    assert_not duplicateUser.valid?
  end
  
end
