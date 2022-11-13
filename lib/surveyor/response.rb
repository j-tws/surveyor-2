module Surveyor
  class Response
    attr_reader :email

    def initialize(email)
      @email = email[:email]
    end

  end
end