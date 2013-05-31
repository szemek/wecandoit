class GithubData
  def initialize(username, repo)
    @repository = Octokit::Repository.new({:username => username, :repo => repo})
  end

  def fetch!
    begin
      repository_details = Octokit.repo(@repository)
      commits_details = Octokit.commits(@repository)

      @gravatar = repository_details['owner']['avatar_url']
      @description = repository_details['description']
      @last_commit_message = commits_details.first['commit']['message']
      date = commits_details.first['commit']['committer']['date']
      @last_commit_date = DateTime.parse(date).in_time_zone('Warsaw')
    rescue Exception => ex
      puts "GithubData Exception: #{ex.message}"
    end
  end

  def to_hash(options = {})
    hash = {}

    hash['gravatar'] = @gravatar
    hash['description'] = @description
    hash['last_commit_message'] = @last_commit_message
    hash['last_commit_date'] = @last_commit_date

    hash
  end

  def as_json(options = {})
    self.to_hash
  end
end
