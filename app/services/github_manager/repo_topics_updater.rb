module GithubManager
    class RepoTopicsUpdater < RepoService
        def initialize(repo_name, update_repo_topics_params)
            super()
            @repo_name = repo_name
            @update_repo_topics_params = update_repo_topics_params
        end

        def call
            HTTParty.put("#{@base_url}/repos/#{@username}/#{@repo_name}/topics",
              :headers => {:accept => 'application/vnd.github.mercy-preview+json'}, 
              :body => @update_repo_topics_params.to_json,
              :basic_auth => {:username => @username , :password => @password}
            )
        end
    end
end