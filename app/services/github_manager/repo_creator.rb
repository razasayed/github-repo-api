module GithubManager
    class RepoCreator < ApplicationService
        def initialize(new_repo_params)
            @base_url = ENV['GITHUB_API_BASE_URL']
            @username = ENV['GITHUB_USERNAME']
            @password = ENV['GITHUB_ACCESS_TOKEN']
            @new_repo_params = new_repo_params
        end

        def call
            HTTParty.post("#{@base_url}/user/repos", 
              :body => @new_repo_params.to_json,
              :basic_auth => {:username => @username , :password => @password}
            )
        end
    end
end