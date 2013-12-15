class ApplicationsToPostulations < ActiveRecord::Migration
  def up
    Application.all.each do |application|
      user = User.where(email: application.email).first
      unless user
        user = User.new email: application.email
        user.fullname = application.name
        user.university_id = application.university_id
        user.degree = application.degree
        user.save(validate: false)
      end
      Postulation.create user: user, advertisement: application.advertisement
      puts "Application to postulation (#{user.email})"
    end
  end

  def down
    Application.all.each do |application|
      u = User.where(email: application.email).first
      if u
        p = Postulation.where(user_id: u.id).first
        u.destroy
        p.destroy
      end
    end    
  end
end
