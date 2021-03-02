module GithubManager
    class ReposLister < RepoService
        def initialize
            super()
        end
        
        def call
            HTTParty.get("#{@base_url}/user/repos", :basic_auth => {:username => @username , :password => @password })
        end
    end
end