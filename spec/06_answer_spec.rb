require 'spec_helper'

RSpec.describe Surveyor::Answer do
  question = {question: 'Is this test question?'}
  value = {value: 'yes'}
  subject {described_class.new(question, value)}

    it 'should be able to ask an answer what its question is' do
      expect(subject.question).to eq('Is this test question?')
    end

    it 'should be able to ask the value for the answer' do
      expect(subject.value).to eq('yes')
    end


end