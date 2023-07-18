class BuscaController < ApplicationController
  def index
  end

  def search
    @posts = Post.where("dev LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    render 'index'
  end
end