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

    private

    def create_repo_params
        params.permit(:name, :private) # Can whitelist more based on requirement
    end
end
