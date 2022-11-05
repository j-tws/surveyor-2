module Surveyor
  class RatingQuestion < Question
    
    def valid_answer? input
      input > 0 && input < 6
    end

  end
end
