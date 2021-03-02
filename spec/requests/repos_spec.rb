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

    describe 'DELETE /repos/:id' do
        context 'with valid repo name' do
            before do
                VCR.use_cassette("delete_repo_valid") do
                    delete '/repos/testrepo'
                end
            end
    
            it 'returns http status code 204' do
                expect(response).to have_http_status(204)
            end
    
            it 'returns an empty response' do
                expect(response.body).to be_empty
            end 
        end

        context 'with invalid repo name' do
            before do
                VCR.use_cassette("delete_repo_invalid") do
                    delete '/repos/testrepo123'
                end
            end
    
            it 'returns http status code 404' do
                expect(response).to have_http_status(404)
            end
    
            it 'returns error details' do
                expect(json).not_to be_empty
                expect(json['message']).to eq('Not Found')
            end 
        end
    end

    describe 'PUT /repos/:id/vulnerability-alerts' do
        before do
            VCR.use_cassette("enable_vulnerability_alerts") do
                put '/repos/testrepo/vulnerability-alerts'
            end
        end

        it 'returns http status code 204' do
            expect(response).to have_http_status(204)
        end

        it 'returns an empty response' do
            expect(response.body).to be_empty
        end 
    end

end