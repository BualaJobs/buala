class AdsController < AdminController

  respond_to :json, :html

  def applications
    respond_with @advertisement.applications
  end

  def update_application
    binding.pry
  end

  def index
  end

  def show
  end

  def seen
  	application = Application.find(params[:application_id])
  	application.seen = true if params[:seen] == "true"
  	application.seen = false if params[:seen] == "false"
  	application.save!
  	render status: :ok, nothing: true
  end

end
