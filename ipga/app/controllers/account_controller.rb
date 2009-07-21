class AccountController < ApplicationController
  skip_before_filter :login_required, :only => [:index, :login]
  def index
    redirect_to(:action => 'login') unless logged_in?
  end

  def login
    return unless request.post?
    self.current_user = User.authenticate(params[:username], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        self.current_user.remember_me!
        cookies[:auth_token] = { :value => self.current_user.remember_token, :expires => self.current_user.remember_token_expires_at }
      end
      redirect_back_or_default(:controller => 'account', :action => 'index')
      flash[:notice] = "Logged in successfully"
    end
  end

  def logout
    self.current_user.forget_me! if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default(:controller => 'account', :action => 'index')
  end

  # GET /resources/1/edit
  def edit
  end

  # PUT /resources/1
  def update
    if current_user.update_attributes(params[:user])
      flash[:notice] = '密码成功更新.'
      redirect_to(mine_resources_path)
    else
      render :action => "edit"
    end
  end

end
