require File.dirname(__FILE__) + '/../spec_helper'

describe ResourcesController do
  fixtures :locations
  describe 'POST create' do
    it 'creates resource' do
      login_as User.first
      lambda do
        post :create, :resource => {:description => 'some thing', :location_id => Location.first.id}
      end.should change(Resource, :count).by(1)

      response.should be_redirect
    end
  end
end
