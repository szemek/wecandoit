module ProjectsHelper
  def github_user(user)
    link_to user, "https://github.com/#{user}"
  end

  def github_repo(user, repo)
    link_to repo, "https://github.com/#{user}/#{repo}"
  end
end
