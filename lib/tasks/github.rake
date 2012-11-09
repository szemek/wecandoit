namespace :github do
  namespace :data do
    desc "Update projects with Github data"
    task :update => :environment do
      Project.all.each do |project|
        data = GithubData.new(project.username, project.repo)
        data.fetch!
        attributes = data.to_hash.reject{|k,v| v.nil?}

        if attributes.present?
          project.update_attributes(attributes)
          puts "Project: #{project.id} has been updated."
        end
      end
    end
  end
end
