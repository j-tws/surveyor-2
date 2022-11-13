module Surveyor

  class Answer
    attr_reader :question, :value

    def initialize(question, value)
      @question = question[:question]
      @value = value[:value]
    end

  end

end

