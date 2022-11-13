module Surveyor
  class RatingQuestion < Question
    def valid_answer?(input)
      input.positive? && input < 6
    end
  end
end
