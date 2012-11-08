require 'open-uri'
require 'json'

class GithubData
  def initialize(username, repository)
    @username = username
    @repository = repository

    @gravatar = nil
    @description = nil
    @last_commit_message = nil
    @last_commit_date = nil
  end

  def fetch!
    begin
      repository_details = JSON.parse(open(repository_url).read)
      commits_details = JSON.parse(open(commits_url).read)

      @gravatar = repository_details['owner']['avatar_url']
      @description = repository_details['description']
      @last_commit_message = commits_details.first['commit']['message']
      date = commits_details.first['commit']['committer']['date']
      @last_commit_date = DateTime.parse(date).in_time_zone('Warsaw')
    rescue Exception => ex
      puts "GithubData Exception: #{ex.message}"
    end
  end

  def as_json(options = {})
    hash = {}

    hash['gravatar'] = @gravatar
    hash['description'] = @description
    hash['last_commit_message'] = @last_commit_message
    hash['last_commit_date'] = @last_commit_date

    hash
  end

  private
    def repository_url
      "https://api.github.com/repos/#{@username}/#{@repository}"
    end

    def commits_url
      "https://api.github.com/repos/#{@username}/#{@repository}/commits"
    end
end
