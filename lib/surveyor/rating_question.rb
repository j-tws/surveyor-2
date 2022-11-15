module Surveyor
  class RatingQuestion < Question
    def valid_answer?(input)
      input.between?(1, 5)
    end
  end
end
