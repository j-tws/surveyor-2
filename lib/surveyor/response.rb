module Surveyor
  class Response
    attr_reader :email, :answers

    def initialize(email:)
      @email = email
      @answers = []
    end

    def add_answer(answer)
      @answers << answer
    end
  end
end
