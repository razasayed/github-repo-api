class ReposController < ApplicationController
    def index
        json_response(GithubManager::ReposLister.call)
    end
end
