require File.dirname(__FILE__) + '/../spec_helper'

describe RequestsController do
  integrate_views

  describe 'POST create' do
    before :each do
      @resource = Resource.first
    end

    it "sends request from sender to receiver about a resource" do
      sender = User.all.detect { |user| user != @resource.owner }
      login_as sender

      lambda do
        post :create, :resource_id => @resource.id
      end.should change(Request, :count).by(1)

      request = Request.last
      request.sender.should == sender
      request.resource.should == @resource
    end

    it "does not send request if sender and receiver are same user" do
      login_as @resource.owner

      lambda do
        post :create, :resource_id => @resource.id
      end.should_not change(Request, :count) 
    end
  end
end