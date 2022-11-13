require 'spec_helper'

RSpec.describe Surveyor::Answer do
  subject {described_class.new(question: 'Is this test question?')}

    it 'should be able to ask an answer what its question is' do
      expect(subject.question).to eq('Is this test question?')
    end

end