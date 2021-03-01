module GithubManager
    class ReposLister < ApplicationService
        def initialize
            @base_url = ENV['GITHUB_API_BASE_URL']
            @username = ENV['GITHUB_USERNAME']
            @password = ENV['GITHUB_ACCESS_TOKEN']
        end

        def call
            HTTParty.get("#{@base_url}/user/repos", :basic_auth => {:username => @username , :password => @password })
        end
    end
end