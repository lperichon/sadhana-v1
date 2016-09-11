require 'nokogiri'

module Contacts
  class Google < OAuthConsumer
    CONSUMER_OPTIONS = Util.frozen_hash(
      :site => "https://www.google.com",
      :request_token_path => "/accounts/OAuthGetRequestToken",
      :access_token_path => "/accounts/OAuthGetAccessToken",
      :authorize_path => "/accounts/OAuthAuthorizeToken"
    )

    REQUEST_TOKEN_PARAMS = Util.frozen_hash(
      'scope' => "https://www.google.com/m8/feeds/"
    )

    def initialize(options={})
      super(CONSUMER_OPTIONS, REQUEST_TOKEN_PARAMS)
    end

    def contacts(options={})
      return nil if @access_token.nil?
      params = {:limit => 200}.update(options)
      google_params = translate_parameters(params)
      query = params_to_query(google_params)
      response = @access_token.get("/m8/feeds/contacts/default/thin?#{query}")
      parse_contacts(response.body)
    end

    private

    def translate_parameters(params)
      params.inject({}) do |all, pair|
        key, value = pair
        unless value.nil?
          key = case key
                when :limit
                  'max-results'
                when :offset
                  value = value.to_i + 1
                  'start-index'
                when :order
                  all['sortorder'] = 'descending' if params[:descending].nil?
                  'orderby'
                when :descending
                  value = value ? 'descending' : 'ascending'
                  'sortorder'
                when :updated_after
                  value = value.strftime("%Y-%m-%dT%H:%M:%S%Z") if value.respond_to? :strftime
                  'updated-min'
                else key
                end

          all[key] = value
        end
        all
      end
    end

    def parse_contacts(body)
      begin
      document = Nokogiri::XML(body)
      document.search('/xmlns:feed/xmlns:entry').map do |entry|
        emails = entry.search('./gd:email[@address]').map{|e| e['address'].to_s}
        next if emails.empty?
        title = entry.at('title') and
          name = title.inner_text
        Contact.new(name, emails)
      end.compact
      rescue
        return nil
      end
    end
  end
end
