module GithubManager
    class RepoDeleter < RepoService
        def initialize(repo_name)
            super()
            @repo_name = repo_name
        end

        def call
            HTTParty.delete("#{@base_url}/repos/#{@username}/#{@repo_name}", :basic_auth => {:username => @username , :password => @password })
        end
    end
end