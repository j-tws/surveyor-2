module Surveyor
  class Question
    attr_reader :title
    def initialize(title:)
      @title = title
    end
  end
end
