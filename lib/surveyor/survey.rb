module Surveyor
  class Survey
    # TODO: change this code to make the test pass
    # TODO: Remove these comments ;)
    attr_reader :name, :questions, :responses

    def initialize(name)
      @name = name[:name]
      @questions = []
      @responses = []
    end

    def add_question(question)
      @questions << question
    end

    def add_response(response)
      @responses << response
    end

    def find_response(email)
      @responses.find {|el| el.email == email}
    end

    def user_responded?(email)
      user = self.find_response(email)
      !user.nil?
    end

    def get_low_answers(question)
      answers = @questions.select {|el| el.title == question}

    end


  end
end
