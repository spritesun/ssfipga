require File.dirname(__FILE__) + '/../spec_helper'

describe AccountController do
  describe 'POST login' do
    it 'should login and redirect' do
      post :login, :username => 'quentin', :password => 'test'
      current_user.should_not be_nil
      response.should be_redirect
    end

    it 'fails to login when password bad' do
      post :login, :username => 'quentin', :password => 'bad password'
      current_user.should be_nil
      response.should be_success
    end
  end

  describe 'POST logout' do
    it 'should logout and logout' do
      login_as User.first
      get :logout
      current_user.should be_nil
      response.should be_redirect
    end
  end
end

#def test_should_remember_me!
#  post :login, :username => 'quentin', :password => 'test', :remember_me => "1"
#  assert_not_nil @response.cookies["auth_token"]
#end
#
#def test_should_not_remember_me!
#  post :login, :username => 'quentin', :password => 'test', :remember_me => "0"
#  assert_nil @response.cookies["auth_token"]
#end
#
#def test_should_delete_token_on_logout
#  login_as :quentin
#  get :logout
#  assert_equal @response.cookies["auth_token"], []
#end
#
#def test_should_login_with_cookie
#  users(:quentin).remember_me!
#  @request.cookies["auth_token"] = cookie_for(:quentin)
#  get :index
#  assert @controller.send(:logged_in?)
#end
#
#def test_should_fail_expired_cookie_login
#  users(:quentin).remember_me!
#  users(:quentin).update_attribute :remember_token_expires_at, 5.minutes.ago
#  @request.cookies["auth_token"] = cookie_for(:quentin)
#  get :index
#  assert !@controller.send(:logged_in?)
#end
#
#def test_should_fail_cookie_login
#  users(:quentin).remember_me!
#  @request.cookies["auth_token"] = auth_token('invalid_auth_token')
#  get :index
#  assert !@controller.send(:logged_in?)
#end
#
#protected
#  def auth_token(token)
#    CGI::Cookie.new('name' => 'auth_token', 'value' => token)
#  end
#
#  def cookie_for(user)
#    auth_token users(user).remember_token
#  end