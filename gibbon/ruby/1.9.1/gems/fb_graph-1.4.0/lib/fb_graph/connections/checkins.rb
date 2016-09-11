module FbGraph
  module Connections
    # == Fetch checkins
    # 
    # * To get a user's check-ins, request the "user_checkins".
    # * To see the user's friends' check-ins, request the "friends_checkins". 
    # ref) http://developers.facebook.com/docs/api#places
    # 
    #   FbGraph::User.new("matake").checkins(:access_token => ACCESS_TOKEN)
    #   FbGraph::Page.new("Tokyo").checkins(:access_token => ACCESS_TOKEN)
    module Checkins
      def checkins(options = {})
        checkins = self.connection(:checkins, options)
        checkins.map! do |checkin|
          Checkin.new(checkin.delete(:id), checkin.merge(
            :access_token => options[:access_token] || self.access_token
          ))
        end
      end

      def checkin!(options = {})
        checkin = post(options.merge(:connection => :checkins))
        Checkin.new(checkin.delete(:id), options.merge(checkin).merge(
          :access_token => options[:access_token] || self.access_token
        ))
      end
    end
  end
end
