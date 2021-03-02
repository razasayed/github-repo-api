module GithubManager
    class RepoUpdater < ApplicationService
        def initialize(repo_name, update_repo_params)
            @base_url = ENV['GITHUB_API_BASE_URL']
            @username = ENV['GITHUB_USERNAME']
            @password = ENV['GITHUB_ACCESS_TOKEN']
            @repo_name = repo_name
            @update_repo_params = update_repo_params
        end

        def call
            HTTParty.patch("#{@base_url}/repos/#{@username}/#{@repo_name}", 
              :body => @update_repo_params.to_json,
              :basic_auth => {:username => @username , :password => @password}
            )
        end
    end
end