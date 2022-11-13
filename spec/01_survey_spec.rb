require 'spec_helper'

RSpec.describe Surveyor::Survey do
  subject { described_class.new(name: "Engagement Survey") }

  it "has a name" do
    expect(subject.name).to eq("Engagement Survey")
  end

  it "can have questions added" do
    question = double(:question)
    subject.add_question(question)
    expect(subject.questions).to include(question)
  end

  it "can have responses added" do
    response = double(:response)
    subject.add_response(response)
    expect(subject.responses).to include(response)
  end

  it "can find a response by the user's email address" do
    response = Surveyor::Response.new(email: 'test@test.co')
    subject.add_response(response)
    expect(subject.find_response('test@test.co')).to eq(response)
  end

  it "can check if a user have responded yet" do
    expect(subject.user_responded?('test@test.com')).to eq(false)
  end

  it "can find 'low' answers for a given rating question" do
    test_question = {question: 'Test question?'}
    question = Surveyor::RatingQuestion.new(test_question)
    answer1 = Surveyor::Answer.new(test_question, 1)
    answer2 = Surveyor::Answer.new(test_question, 2)
    answer3 = Surveyor::Answer.new(test_question, 1)
    expect(subject.get_low_answer('Test question?')).to eq(3)
  end

end
