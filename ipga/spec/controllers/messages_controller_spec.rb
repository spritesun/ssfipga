require File.dirname(__FILE__) + '/../spec_helper'

describe MessagesController do
  integrate_views

  describe 'POST create' do
    before :each do
      @resource = Resource.first
      @sender = User.all.detect { |user| user != @resource.owner }
      login_as @sender

    end

    it "sends request from sender to receiver about a resource" do

      lambda do
        lambda do
          post :create, :resource_id => @resource.id, :message => {:title => 'meessage title', :body => 'message body'}
        end.should change(Request, :count).by(1)
      end.should change(Message, :count).by(1)

      message = Message.last
      message.title.should == 'meessage title'
      message.body.should == 'message body'

      request = message.request
      request.sender.should == @sender
      request.resource.should == @resource
      request.sender_friendly_name.should_not be_blank
      request.receiver_friendly_name.should_not be_blank
    end

    it "fail to send request when missing title or body" do
      lambda do
        lambda do
          post :create, :resource_id => @resource.id, :message => {:title => '', :body => ''}
        end.should_not change(Request, :count)
      end.should_not change(Message, :count)
    end
  end
end