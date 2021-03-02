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


    describe 'POST /repos' do
        context 'with valid parameters' do
            before do
                VCR.use_cassette("create_repo_valid_params") do
                    post '/repos', :params => {:name => 'testrepo', :private => true} 
                end
            end

            it 'returns http status code 201' do
                expect(response).to have_http_status(201)
            end

            it 'returns information about the newly created repo' do
                expect(json).not_to be_empty
                expect(json['name']).to eq('testrepo')
            end
        end

        context 'with invalid parameters' do
            before do
                VCR.use_cassette("create_repo_invalid_params") do
                    post '/repos' 
                end
            end

            it 'returns http status code 422' do
                expect(response).to have_http_status(422)
            end

            it 'returns error message' do
                expect(json).not_to be_empty
                expect(json['message']).to eq('Repository creation failed.')
            end
        end
    end
end