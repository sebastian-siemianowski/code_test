# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Submission Form', type: :request do
  it 'it creates correct submission' do
    VCR.use_cassette 'correct_submission' do
      post '/submissions', params: { submission: { business_name: 'foo', name: 'John Doe', telephone_number: '07517419898' } }

      expect(response).to redirect_to(submissions_path)
      follow_redirect!
      expect(response.body).to include('You&#39;re query had been sent and will be dealt with soon')
    end
  end

  it 'it shows error if name is not present' do
    VCR.use_cassette 'correct_submission' do
      post '/submissions', params: { submission: { name: 'John Doe', telephone_number: '07517419898' } }

      expect(response).to redirect_to(submissions_path)
      follow_redirect!
      expect(response.body).to include('Business name can&#39;t be blank')
    end
  end

  it 'it shows error if name is not present' do
    VCR.use_cassette 'correct_submission' do
      post '/submissions', params: { submission: { business_name: 'foo', telephone_number: '07517419898' } }

      expect(response).to redirect_to(submissions_path)
      follow_redirect!
      expect(response.body).to include('Name can&#39;t be blank')
    end
  end

  it 'it shows error if telephone is not present' do
    VCR.use_cassette 'correct_submission' do
      post '/submissions', params: { submission: { business_name: 'foo', name: 'John Doe' } }

      expect(response).to redirect_to(submissions_path)
      follow_redirect!
      expect(response.body).to include('Telephone number can&#39;t be blank')
    end
  end
end
