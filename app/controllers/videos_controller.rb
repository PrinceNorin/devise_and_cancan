class VideosController < ApplicationController
  load_and_authorize_resource except: [:index]
  
  # before_action :set_video, only: [:show, :edit, :update, :destroy]
  
  respond_to :html, :json
  
  def index
    @videos = Video.all
    respond_with(@videos)
  end

  def show
    respond_with(@video)
  end

  def new
    respond_with(@video)
  end

  def edit
  end

  def create
    @video.save
    respond_with(@video)
  end

  def update
    respond_with(@video)
  end

  def destroy
    @video.destroy
    respond_with(@video)
  end

  private
    # def set_video
    #   @video = Video.find(params[:id])
    # end

    def video_params
      params.require(:video).permit(:title, :url)
    end
end
