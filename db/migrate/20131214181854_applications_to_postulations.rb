require 'open-uri'

class ApplicationsToPostulations < ActiveRecord::Migration
  def up
    Application.all.each do |application|
      user = User.where(email: application.email).first
      unless user
        user = User.new email: application.email
        user.fullname = application.name
        user.university_id = application.university_id
        user.degree = application.degree
        io = open(URI.parse(application.resume.url))
        user.resume = io
        user.save(validate: false)
      end
      Postulation.create user: user, advertisement: application.advertisement
    end
  end

  def down
    Application.all.each do |application|
      u = User.where(email: application.email).first
      p = Postulation.where(user: u).first
      u.destroy
      p.destroy
    end    
  end
end
