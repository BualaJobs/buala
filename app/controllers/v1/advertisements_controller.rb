class V1::AdvertisementsController < V1::BaseController
  inherit_resources

  protected
  def begin_of_association_chain
    @company
  end

end
