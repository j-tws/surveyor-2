require 'spec_helper'

RSpec.describe Surveyor::Answer do
  subject {described_class.new(question: 'Is this test question?', answer: 'yes')}

    it 'should be able to ask an answer what its question is' do
      expect(subject.question).to eq('Is this test question?')
    end

    it 'should be able to ask the value for the answer' do
      expect(subject.value).to eq('yes')
    end
    

end