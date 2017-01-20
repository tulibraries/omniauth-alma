require 'omniauth'

module OmniAuth
  module Strategies
    class Alma
      include OmniAuth::Strategy
      include OmniAuth::Strategy

      option :fields, [:username]
      option :uid_field, :username

      uid do
        request.params[options.uid_field.to_s]
      end

      info do
        options.fields.inject({}) do |hash, field|
          hash[field] = request.params[field.to_s]
          hash
        end
      end
      

      def request_phase
        form = OmniAuth::Form.new(:title => "Alma Username", :url => callback_path)
        options.fields.each do |field|
          form.text_field field.to_s.capitalize.gsub("_", " "), field.to_s
        end
        form.button "Sign In"
        form.to_response
      end

    end
  end
end
