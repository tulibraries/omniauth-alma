require 'alma'

module OmniAuth
  module Strategies
    class Alma
      include OmniAuth::Strategy

      options :fields, [:username, :password]
      options :uid_field, :username

      option :on_failed_registration, nil

      uid do
        request.params[options.uid_field.to_s]
      end

      info do
        {name: request.params[options.uid_field.to_s]}
      end

      def request_phase
        if username && password
          r = Rack::Response.new
          r.redirect(callback_path, 307)
          r.finish
        else
          OmniAuth::Form.build(
              title: (options[:title] || "Alma Authentication"),
              url: callback_path
          ) do |f|
            f.text_field 'Username', options.params.username
            f.password_field 'Password', options.params.password
          end.to_response
        end
      end

      def callback_phase
        return fail!(:invalid_credentials) if not identity
        super
      end

      def identity
        return unless username && password
        ::Alma::User.authenticate({user_id: username, password: password})
      end

      protected

      def username
        request.params[options.fields.username]
      end

      def password
        request.params[options.fields.password]
      end
    end
  end
end