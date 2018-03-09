# frozen_string_literal: true

require 'rails_helper'

describe Submission do
  subject { described_class.new }

  let(:access_token) { 'provide_by_maket_it_cheaper' }
  let(:pGUID) { 'CFFBF53F-6D89-4B5B-8B36-67A97F18EDEB' }
  let(:pAccName) { 'MicDevtest' }
  let(:pPartner) { 'MicDevtest' }

  it 'returns correct access token' do
    expect(subject.access_token).to eq access_token
  end

  it 'returns correct pGUID' do
    expect(subject.pGUID).to eq pGUID
  end

  it 'returns correct pAccName' do
    expect(subject.pAccName).to eq pAccName
  end

  it 'returns correct pPartner' do
    expect(subject.pPartner).to eq pPartner
  end

  describe '#name' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe '#business_name' do
    it { is_expected.to validate_presence_of(:business_name) }
  end

  describe '#telephone_number' do
    it { is_expected.to validate_presence_of(:telephone_number) }
  end

  describe '#email' do
    it { should validate_length_of(:email).is_at_most(80) }
  end

  describe '#notes' do
    it { should validate_length_of(:notes).is_at_most(255) }
  end

  describe '#reference' do
    it { should validate_length_of(:reference).is_at_most(50) }
  end
end
