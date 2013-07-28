class HomeController < ApplicationController
  
  def index
  	@top_ads = Advertisement.published.sample(3)
  end

end
