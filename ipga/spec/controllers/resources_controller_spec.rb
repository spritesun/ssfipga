require File.dirname(__FILE__) + '/../spec_helper'

describe ResourcesController do
  fixtures :locations, :strengths, :departments, :levels, :industries, :official_grades
  describe 'POST create' do
    it 'creates resource' do
      login_as User.first
      lambda do
        post :create, :resource => {:description => 'some thing', :location_id => Location.first.id, :strength_id => Strength.first.id,
                                    :industry_id => Industry.first.id, :department_id => Department.first.id, :level_id => Level.first.id,
                                    :official_grade_id => OfficialGrade.first.id}
      end.should change(Resource, :count).by(1)

      response.should be_redirect
    end
  end
end
