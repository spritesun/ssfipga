require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  before :each do
    @user = User.find_by_username('quentin')
  end
  describe 'authenticate' do
    it 'should authenticate user' do
      @user.should == User.authenticate('quentin', 'test')
    end
  end

  it 'should able to update password' do
    @user.update_attributes(:password => 'new password', :password_confirmation => 'new password')
    @user.should == User.authenticate('quentin', 'new password')
  end
end
#  def test_should_set_remember_token
#    users(:quentin).remember_me!
#    assert_not_nil users(:quentin).remember_token
#    assert_not_nil users(:quentin).remember_token_expires_at
#  end
#
#  def test_should_unset_remember_token
#    users(:quentin).remember_me!
#    assert_not_nil users(:quentin).remember_token
#    users(:quentin).forget_me!
#    assert_nil users(:quentin).remember_token
#  end