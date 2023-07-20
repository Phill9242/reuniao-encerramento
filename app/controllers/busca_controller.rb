class BuscaController < ApplicationController
  def index
  end

  def search
    @posts = Post.all
    @posts = @posts.where("dev LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    @posts = @posts.where(status: params[:status]) if params[:status] != 'Todos'
    @posts = @posts.where(good_bad: params[:good_bad]) if params[:good_bad] != 'Todos'

    if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      @posts = @posts.where(date: start_date..end_date)
    end 

    render 'index'
  end
end
