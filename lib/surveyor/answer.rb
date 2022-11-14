module Surveyor

  class Answer
    attr_reader :question, :value

    def initialize(question, value)
      @question = question[:title]
      @value = value[:value]
    end

  end

end

