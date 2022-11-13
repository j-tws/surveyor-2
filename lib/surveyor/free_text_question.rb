module Surveyor
  class FreeTextQuestion < Question
    def valid_answer?(input)
      input.class == String
    end
  end
end
