require 'spec_helper'

RSpec.describe Surveyor::Response do
  subject { described_class.new(email: 'test@survey.com') }

  it 'should have an email' do
    expect(subject.email).to eq('test@survey.com')
  end


end