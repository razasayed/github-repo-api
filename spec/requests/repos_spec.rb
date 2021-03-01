require 'rails_helper'

RSpec.describe 'Repos API', type: :request do
    describe 'GET /repos' do
        before do
            VCR.use_cassette("get_repos") do
                get '/repos'
            end
        end

        it 'returns http status code 200' do
            expect(response).to have_http_status(200)
        end

        it 'returns a list of repos of the user' do
            expect(json).not_to be_empty
        end
    end
end