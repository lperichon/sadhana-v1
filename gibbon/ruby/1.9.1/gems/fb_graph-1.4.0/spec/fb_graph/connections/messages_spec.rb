require File.join(File.dirname(__FILE__), '../../spec_helper')

describe FbGraph::Connections::Messages, '#messages' do
  before do
    fake_json(:get, '12345/messages?access_token=access_token&no_cache=true', 'thread/messages/private')
  end

  it 'should use cached contents as default' do
    lambda do
      FbGraph::Thread.new(12345, :access_token => 'access_token').messages
    end.should_not request_to '12345/messages?access_token=access_token'
  end

  it 'should not use cached contents when options are specified' do
    lambda do
      FbGraph::Thread.new(12345).messages(:no_cache => true)
    end.should request_to '12345/messages?no_cache=true'
  end

  it 'should return threads as FbGraph::Message' do
    messages = FbGraph::Thread.new(12345, :access_token => 'access_token').messages(:no_cache => true)
    messages.each do |message|
      message.should be_instance_of(FbGraph::Message)
    end
  end
end