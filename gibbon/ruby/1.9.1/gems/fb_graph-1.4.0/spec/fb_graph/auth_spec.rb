require File.join(File.dirname(__FILE__), '../spec_helper')

describe FbGraph::Auth, '.new' do

  it 'should setup OAuth2::Client' do
    auth = FbGraph::Auth.new('client_id', 'client_secret')
    auth.client.should be_a(OAuth2::Client)
    auth.client.id.should            == 'client_id'
    auth.client.secret.should == 'client_secret'
  end

  context 'when invalid cookie given' do
    it 'should raise FbGraph::VerificationFailed' do
      lambda do
        FbGraph::Auth.new('client_id', 'client_secret', :cookie => 'invalid')
      end.should raise_exception(FbGraph::Auth::VerificationFailed)
    end
  end

end

describe FbGraph::Auth, '.from_cookie' do
  before do
    @auth = FbGraph::Auth.new('client_id', 'client_secret')
    @expires_at = Time.parse('2020-12-31 12:00:00')
    @cookie = {
      'fbs_client_id' => "access_token=t&expires=#{@expires_at.to_i}&secret=s&session_key=k&sig=b06a0540959470e731cc3bc2ef31a007&uid=12345"
    }
  end

  it 'should fetch user and access_token from fbs_APP_ID cookie' do
    @auth.access_token.should be_nil
    @auth.user.should be_nil
    @auth.from_cookie(@cookie)
    @auth.access_token.token.should      == 't'
    @auth.access_token.expires_in.should be_close @expires_at - Time.now, 1
    @auth.access_token.expires_at.should be_close @expires_at, 1
    @auth.user.identifier.should         == '12345'
    @auth.user.access_token.token.should == 't'
  end

  context 'when invalid cookie given' do
    it 'should raise FbGraph::VerificationFailed' do
      lambda do
        @auth.from_cookie('invalid')
      end.should raise_exception(FbGraph::Auth::VerificationFailed)
    end
  end

end