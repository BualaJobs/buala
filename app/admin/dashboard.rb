ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do 
        panel "Statistics" do
          
          users_total = User.all.count
          applications_total = Postulation.all.count
          users_not_applied = User.joins("LEFT OUTER JOIN postulations ON users.id = postulations.user_id").where("postulations.user_id IS null").count
          advertisements_total = Advertisement.all.count
          advertisements_without_applications = Advertisement.joins("LEFT OUTER JOIN postulations ON advertisements.id = postulations.advertisement_id").where("postulations.advertisement_id IS null").count
          migrated_users = User.where(migrated: true).count
          migrated_users_registered = users_total - User.where("migrated = true and COALESCE(encrypted_password, '') = ''").count

          ul do
            li do
              h4 do
                strong "Total applications: " 
                span "#{applications_total}."
              end
            end
            li do
              h4 do
                strong "Total users: "
                span "#{users_total}."
              end
            end
            li do
              h4 do
                strong "Total advertisements: "
                span "#{advertisements_total}."
              end
            end
            li do
              h4 do
                strong "Users who've not applied: "
                span "#{users_not_applied} - #{((users_not_applied * 1.0/users_total) * 100).round(2)} %."
              end
            end
            li do
              h4 do
                strong "Advertisements without applications: "
                span "#{advertisements_without_applications} - #{((advertisements_without_applications * 1.0/advertisements_total) * 100).round(2)} %."
              end
            end
            li do
              h4 do
                strong "Migrated users: "
                span "#{migrated_users_registered} - #{((migrated_users_registered * 1.0/migrated_users) * 100).round(2)} %."
              end
            end
          end
        end
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
