namespace :dropbox_urls do
	desc "Updates application dropbox URLs"
	task :update => :environment do
		Application.update_dropbox_urls
	end
end
