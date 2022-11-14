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
    response = Surveyor::Response.new(email: 'test@test.co')
    subject.add_response(response)
    expect(subject.user_responded?('test@test.com')).to eq(false)
    expect(subject.user_responded?('test@test.co')).to eq(true)
  end

  it "can find the amount of all 'low' answers" do
    question = {title: 'test question?'}

    subject.add_question( Surveyor::RatingQuestion.new(question) )

    response1 = Surveyor::Response.new(email: '1@test.com')
    response2 = Surveyor::Response.new(email: '2@test.com')
    response3 = Surveyor::Response.new(email: '3@test.com')

    response1.add_answer( Surveyor::Answer.new( question, {value: 1}) )
    response2.add_answer( Surveyor::Answer.new( question, {value: 2}) )
    response3.add_answer( Surveyor::Answer.new( question, {value: 3}) )

    subject.add_response(response1)
    subject.add_response(response2)
    
    expect(subject.get_low_answers()).to eq(2)
  end

  it "can find the amount of all 'neutral' answers" do
    question = {title: 'test question?'}

    subject.add_question( Surveyor::RatingQuestion.new(question) )

    response1 = Surveyor::Response.new(email: '1@test.com')
    response2 = Surveyor::Response.new(email: '2@test.com')
    response3 = Surveyor::Response.new(email: '3@test.com')

    response1.add_answer( Surveyor::Answer.new( question, {value: 3}) )
    response2.add_answer( Surveyor::Answer.new( question, {value: 1}) )
    response3.add_answer( Surveyor::Answer.new( question, {value: 1}) )

    subject.add_response(response1)
    subject.add_response(response2)
    
    expect(subject.get_neutral_answers()).to eq(1)
  end

  it "ccan find the amount of all 'high' answers" do
    question = {title: 'test question?'}

    subject.add_question( Surveyor::RatingQuestion.new(question) )

    response1 = Surveyor::Response.new(email: '1@test.com')
    response2 = Surveyor::Response.new(email: '2@test.com')
    response3 = Surveyor::Response.new(email: '3@test.com')

    response1.add_answer( Surveyor::Answer.new( question, {value: 4}) )
    response2.add_answer( Surveyor::Answer.new( question, {value: 5}) )
    response3.add_answer( Surveyor::Answer.new( question, {value: 1}) )

    subject.add_response(response1)
    subject.add_response(response2)
    
    expect(subject.get_high_answers()).to eq(2)
  end

  it "can give us a break down of the answers for a particular rating question" do
    question = {title: 'test question?'}

    subject.add_question( Surveyor::RatingQuestion.new(question) )

    response1 = Surveyor::Response.new(email: '1@test.com')
    response2 = Surveyor::Response.new(email: '2@test.com')
    response3 = Surveyor::Response.new(email: '3@test.com')
    response4 = Surveyor::Response.new(email: '4@test.com')
    response5 = Surveyor::Response.new(email: '5@test.com')
    response6 = Surveyor::Response.new(email: '6@test.com')
    response7 = Surveyor::Response.new(email: '7@test.com')
    response8 = Surveyor::Response.new(email: '8@test.com')

    response1.add_answer( Surveyor::Answer.new( question, {value: 1}) )
    response2.add_answer( Surveyor::Answer.new( question, {value: 1}) )
    response3.add_answer( Surveyor::Answer.new( question, {value: 2}) )
    response4.add_answer( Surveyor::Answer.new( question, {value: 3}) )
    response5.add_answer( Surveyor::Answer.new( question, {value: 4}) )
    response6.add_answer( Surveyor::Answer.new( question, {value: 5}) )
    response7.add_answer( Surveyor::Answer.new( question, {value: 5}) )
    response8.add_answer( Surveyor::Answer.new( question, {value: 5}) )

    subject.add_response(response1)
    subject.add_response(response2)
    subject.add_response(response3)
    subject.add_response(response4)
    subject.add_response(response5)
    subject.add_response(response6)
    subject.add_response(response7)
    subject.add_response(response8)

    expect(subject.answer_breakdown(question)).to eq({
      1 => 2,
      2 => 1,
      3 => 1,
      4 => 1,
      5 => 3
    })
  end

end
