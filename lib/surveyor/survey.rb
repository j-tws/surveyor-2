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
      get_answers_of_question(question)
        .select {|answer| answer.value < 3}
        .length
    end

    def get_neutral_answers(question)
      get_answers_of_question(question)
        .select {|answer| answer.value == 3}
        .length
    end

    def get_high_answers(question)
      get_answers_of_question(question)
        .select {|answer| answer.value > 3}
        .length
    end

    def answer_breakdown(question)
      breakdown = {
        1 => 0,
        2 => 0,
        3 => 0,
        4 => 0,
        5 => 0
      }

      get_answers_of_question(question).each do |answer|
        breakdown[answer.value] += 1
      end

      breakdown
    end

    def get_answers_of_question(question)
      answer_array = []

      @responses.each do |response|
        response.answers.each do |answer|
          if answer.question == question[:title]
            answer_array << answer
          end
        end
      end

      answer_array
    end

  end
end
