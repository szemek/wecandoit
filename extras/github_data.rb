require 'open-uri'
require 'json'

class GithubData
  def initialize(user, repo)
    @user = user
    @repo = repo
  end

  def fetch!
    @repo_info = repo_details
    @commits_info = commits_details
  end

  def as_json(options = {})
    hash = {}

    hash['gravatar'] = @repo_info['owner']['avatar_url']
    hash['description'] = @repo_info['description']
    hash['last_commit_message'] = @commits_info.first['commit']['message']
    date = @commits_info.first['commit']['committer']['date']
    hash['last_commit_date'] = DateTime.parse(date).in_time_zone('Warsaw')

    hash
  end

  private
    def repo_details
      JSON.parse(open(repo_url).read)
    end

    def commits_details
      JSON.parse(open(commits_url).read)
    end

    def repo_url
      "https://api.github.com/repos/#{@user}/#{@repo}"
    end

    def commits_url
      "https://api.github.com/repos/#{@user}/#{@repo}/commits"
    end
end
