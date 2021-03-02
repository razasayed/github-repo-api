class ReposController < ApplicationController
    def index
        json_response(GithubManager::ReposLister.call)
    end

    def create
        json_response(GithubManager::RepoCreator.call(create_repo_params))
    end

    def destroy
        json_response(GithubManager::RepoDeleter.call(params[:id]))
    end

    def vulnerability_alerts
        json_response(GithubManager::RepoVulnerabilityAlertsEnabler.call(params[:id]))
    end

    def update
        json_response(GithubManager::RepoUpdater.call(params[:id], update_repo_params))
    end

    def topics
        json_response(GithubManager::RepoTopicsUpdater.call(params[:id], update_repo_topics_params))
    end

    private

    def create_repo_params
        params.permit(:name, :private) # Can whitelist more based on requirement
    end

    def update_repo_params
        params.permit(:name, :description)
    end

    def update_repo_topics_params
        params.permit(:names => [])
    end
end
