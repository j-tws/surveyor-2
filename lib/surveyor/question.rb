module Surveyor
  class Question
    attr_reader :question
    def initialize(question)
      @question = question[:question]
    end
  end
end

