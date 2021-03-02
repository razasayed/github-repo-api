module GithubManager
  class RepoService < ApplicationService
    def initialize
      super()
      @base_url = ENV['GITHUB_API_BASE_URL']
      @username = ENV['GITHUB_USERNAME']
      @password = ENV['GITHUB_ACCESS_TOKEN']
    end
  end
end
