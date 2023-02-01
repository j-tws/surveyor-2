require 'spec_helper'

RSpec.describe Surveyor::Survey do
  subject { described_class.new(name: "Engagement Survey") }

  context "survey should have these basic methods" do
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
  end

  context "survey should have methods that can find response and check if user responded" do
    response = Surveyor::Response.new(email: 'test@test.co')

    before do
      subject.add_response(response)
    end

    it "can find a response by the user's email address" do
      expect(subject.find_response('test@test.co')).to eq(response)
    end

    it "can check if a user have responded yet" do
      expect(subject.user_responded?('test@test.co')).to eq(true)
      expect(subject.user_responded?('test@test.com')).to eq(false)
    end
  end

  context "survey can find low/neutral/high answers and answer breakdown" do
    question = { title: 'test question?' }
    question2 = { title: 'second test question?' }
    answer1 = [1, 1, 2, 3, 3, 4, 4, 4, 5, 5]
    answer2 = [1, 2, 2, 2, 3, 3, 3, 4, 5, 5]

    before do
      answer1.each_with_index do |value, i|
        response = Surveyor::Response.new(email: "#{i}@test.com")
        response.add_answer(Surveyor::Answer.new(question: question, value: value))
        subject.add_response(response)
      end

      answer2.each_with_index do |value, i|
        response = Surveyor::Response.new(email: "#{i}@test.com")
        response.add_answer(Surveyor::Answer.new(question: question2, value: value))
        subject.add_response(response)
      end
    end

    it "can find the amount of all 'low' answers" do
      expect(subject.get_low_answers(question)).to eq(3)
      expect(subject.get_low_answers(question2)).to eq(4)
    end

    it "can find the amount of all 'neutral' answers" do
      expect(subject.get_neutral_answers(question)).to eq(2)
      expect(subject.get_neutral_answers(question2)).to eq(3)
    end

    it "ccan find the amount of all 'high' answers" do
      expect(subject.get_high_answers(question)).to eq(5)
      expect(subject.get_high_answers(question2)).to eq(3)
    end

    it "can give us a break down of the answers for a particular rating question" do
      expect(subject.answer_breakdown(question)).to eq(
        1 => 2,
        2 => 1,
        3 => 2,
        4 => 3,
        5 => 2,
      )

      expect(subject.answer_breakdown(question2)).to eq(
        1 => 1,
        2 => 3,
        3 => 3,
        4 => 1,
        5 => 2,
      )
    end
  end
end
