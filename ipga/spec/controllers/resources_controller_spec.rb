require File.dirname(__FILE__) + '/../spec_helper'

describe ResourcesController do
  describe 'POST create' do
    it 'could not create resource without title' do
      login_as User.first
      lambda do
        post :create, :resource => {:title => '', :description => 'some thing'}
      end.should_not change(Resource, :count)

      response.should_not be_redirect
    end
  end
end
