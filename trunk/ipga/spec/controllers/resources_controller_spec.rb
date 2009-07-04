require File.dirname(__FILE__) + '/../spec_helper'

describe ResourcesController do

  before :each do
    login_as User.first
  end

  describe 'POST create' do
    it 'creates resource' do
      lambda do
        post :create, :resource => {:description => 'some thing', :location_id => Location.first.id, :strength_id => Strength.first.id,
                                    :industry_id => Industry.first.id, :department_id => Department.first.id, :level_id => Level.first.id,
                                    :official_grade_id => OfficialGrade.first.id}
      end.should change(Resource, :count).by(1)

      response.should be_redirect
    end
  end

  describe 'GET search' do
    [:industry, :level, :official_grade, :department, :location].each do |attr|
      it "search keywords by partially match of #{attr}" do
        partly_name = attr.constantize.first.name[0..-2]
        get :search, :keyword => partly_name
        assigns[:results].each do |resource|
          resource.send(attr).name.should be_include(partly_name)
        end
      end
    end
  end

  describe 'GET mine' do
    it 'list resources related to current user' do
      get :mine
      assigns[:resources].each do |resource|
        resource.owner.should == current_user
      end
    end
  end
end
