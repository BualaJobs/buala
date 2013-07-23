class HomeController < ApplicationController
  
  def index
  	@top_ads = Advertisement.all.sample(3)
  end

end
