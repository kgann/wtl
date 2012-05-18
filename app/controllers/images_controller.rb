class ImagesController < ApplicationController
  def thumb_path
    img = Image.find(params[:id])
    render :json => { :url => img.asset.url(:thumb), :id => img.id }
  end
end