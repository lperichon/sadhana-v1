module FbGraph
  module Connections
    module Likes
      def likes(options = {})
        likes = if @_likes_ && options.blank?
          self.connection(:likes, options.merge(:cached_collection => @_likes_))
        else
          self.connection(:likes, options)
        end
        likes.map! do |like|
          identifier = like.delete(:id)
          like.merge!(
            :access_token => options[:access_token] || self.access_token
          )
          if like[:category]
            Page.new(identifier, like)
          else
            User.new(identifier, like)
          end
        end
      end

      # NOTE: likes! is defined in fb_graph/connections/comments.rb
    end
  end
end