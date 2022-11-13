module Surveyor

  class Answer < Response
    attr_reader :question, :value

    def initialize(question, value)
      @question = question[:question]
      @value = 
    end

  end

end