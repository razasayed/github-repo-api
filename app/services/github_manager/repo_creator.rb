module GithubManager
  class RepoCreator < RepoService
    def initialize(new_repo_params)
      super()
      @new_repo_params = new_repo_params
    end

    def call
      HTTParty.post("#{@base_url}/user/repos",
                    body: @new_repo_params.to_json,
                    basic_auth: { username: @username, password: @password })
    end
  end
end
