# frozen_string_literal: true

module Users
  # Handles authentication for users
  class AuthenticationHandler
    def initialize(site = nil)
      @site = site
    end
  end
end
