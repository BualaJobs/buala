class V1::PostulationsController < V1::BaseController
  inherit_resources

  before_filter :set_advertisement

  def index
    postulants = Postulation.full_postulants(@advertisement)
    render json: postulants, each_serializer: FullPostulationSerializer
  end

  def update
    p = Postulation.where(advertisement_id: @advertisement.id, user_id: params[:id]).first
    p.update_attribute(:seen, params[:seen])
    p.save!
    render nothing: true, status: :accepted
  end

  protected
  def begin_of_association_chain
    @advertisement
  end

  def set_advertisement
    @advertisement = @company.advertisements.find(params[:advertisement_id])
  end
end
