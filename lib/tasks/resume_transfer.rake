require 'open-uri'

namespace :migration do
  desc "Transfers all old resumes to S3"
  task :dropbox_to_s3 => :environment do
    from = ENV['from']
    to = ENV['to']
    if to && from && from < to
      Application.where("id >= ? and id < ?", from, to).each do |application|
        user = User.where(email: application.email).first
        if user
          user.resume = URI.parse(application.resume.url)
          user.save(validate: false)
          puts "Resume migrated (#{user.email})"
        end
      end
    else
      puts "No migration performed"
    end
  end
end