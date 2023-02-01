require 'spec_helper'

RSpec.describe Surveyor::Answer do
  question = { title: 'Is this test question?' }
  value = { value: 'yes' }
  subject { described_class.new(question: question, value: value) }

  it 'should be able to ask an answer what its question is' do
    expect(subject.question[:title]).to eq('Is this test question?')
  end

  it 'should be able to ask the value for the answer' do
    expect(subject.value[:value]).to eq('yes')
  end
end
