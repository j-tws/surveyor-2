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
      low_value_answers = 0
      @responses.each do |response|
        response.answers.each do |answer|
          if answer.value < 3 && answer.question == question[:title]
            low_value_answers += 1
          end
        end
      end
      low_value_answers
    end

    def get_neutral_answers(question)
      neutral_value_answers = 0
      @responses.each do |response|
        response.answers.each do |answer|
          if answer.value == 3 && answer.question == question[:title]
            neutral_value_answers += 1
          end
        end
      end
      neutral_value_answers
    end

    def get_high_answers(question)
      high_value_answers = 0
      @responses.each do |response|
        response.answers.each do |answer|
          if answer.value > 3 && answer.question == question[:title]
            high_value_answers += 1
          end
        end
      end
      high_value_answers
    end

    def answer_breakdown(question)
      breakdown = {
        1 => 0,
        2 => 0,
        3 => 0,
        4 => 0,
        5 => 0
      }

      @responses.each do |response|
        response.answers.each do |answer|
          if answer.question == question[:title]
            breakdown[answer.value] += 1
          end
        end
      end

      breakdown

    end
  end
end
