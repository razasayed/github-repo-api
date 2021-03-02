module GithubManager
    class RepoDeleter < ApplicationService
        def initialize(repo_name)
            @base_url = ENV['GITHUB_API_BASE_URL']
            @username = ENV['GITHUB_USERNAME']
            @password = ENV['GITHUB_ACCESS_TOKEN']
            @repo_name = repo_name
        end

        def call
            HTTParty.delete("#{@base_url}/repos/#{@username}/#{@repo_name}", :basic_auth => {:username => @username , :password => @password })
        end
    end
end