# frozen_string_literal: true

module Users
  # Class for handling new user registration
  class RegistrationHandler
    attr_reader :errors, :site

    def initialize(site)
      @site = site
      @errors = {}
    end

    def register(parameters)
      attributes = only_permitted_parameters(parameters).merge(site: @site)
      user = User.create(attributes)
      @errors = user.errors.messages
      user.persisted?
    end

    def self.permitted_parameters
      %i[email password password_confirmation slug]
    end

    private

    def only_permitted_parameters(parameters)
      self.class.permitted_parameters.index_with do |parameter|
        parameters[parameter]
      end
    end
  end
end
