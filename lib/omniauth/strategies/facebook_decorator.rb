module OmniAuth
  module Strategies
    Facebook.class_eval do
      def request_phase
        session["invited-by"] = request.params["invited-by"]
        super
      end
    end
  end
end