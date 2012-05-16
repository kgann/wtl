class ImagesController < ApplicationController
  def thumb_path
    render :text => Image.find(params[:id]).asset.url(:thumb)
  end
end