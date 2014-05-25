class Ckeditor::PicturesController < Ckeditor::ApplicationController
  before_filter :authenticate

  def index
    @pictures = Ckeditor.picture_adapter.find_all(ckeditor_pictures_scope)
    @pictures = Ckeditor::Paginatable.new(@pictures).page(params[:page])

    respond_with(@pictures, :layout => @pictures.first_page?)
  end

  def create
    @picture = Ckeditor.picture_model.new
    respond_with_asset(@picture)
  end

  def destroy
    @picture.destroy
    respond_with(@picture, :location => pictures_path)
  end

  protected

  def find_asset
    @picture = Ckeditor.picture_adapter.get!(params[:id])
  end

  def authorize_resource
    model = (@picture || Ckeditor.picture_model)
    @authorization_adapter.try(:authorize, params[:action], model)
  end

  private 

  def authenticate
    authenticate_or_request_with_http_basic do |name, password|
      name == 'admin' && password == 'password'
    end
  end
end
