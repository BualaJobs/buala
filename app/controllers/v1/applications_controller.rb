class V1::ApplicationsController < V1::BaseController
  inherit_resources

  before_filter :set_advertisement

  def update
  	params[:application].except! :university
  	update!
  end

  protected
  def begin_of_association_chain
    @advertisement
  end

  def set_advertisement
    @advertisement = @company.advertisements.find(params[:advertisement_id])
  end

end
