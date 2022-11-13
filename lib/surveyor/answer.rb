module Surveyor

  class Answer < Response
    attr_reader :question

    def initialize
      @question
    end

  end

end