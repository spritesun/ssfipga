require File.dirname(__FILE__) + '/../spec_helper'

describe RequestsHelper do
  describe 'display_name' do
    before :each do
      @resource = Resource.first
      @sender = User.all.detect { |user| user != @resource.owner }
      @a_request = Request.create!(:resource => @resource, :sender => @sender)
    end

    it 'displays sender fridenly name when current_user is not sender' do
      login_as @resource.owner
      helper.display_name(@a_request, :sender).should == @a_request.sender_friendly_name
    end

    it 'displays real sender name when current_user is sender' do
      login_as @sender
      helper.display_name(@a_request, :sender).should == "#{@a_request.sender.username}(#{@a_request.sender_friendly_name})"
    end

    it 'displays real receiver name when current_user is receiver' do
      login_as @resource.owner
      helper.display_name(@a_request, :receiver).should == "#{@a_request.receiver.username}(#{@a_request.receiver_friendly_name})"
    end
  end
end
