class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @criar = "Criar"
    @post = Post.new
    @devs = Dev.all.order(:name)
  end

  def edit
    @atualizar = "Atualizar"
    @devs = Dev.all.order(:name)
  end

  def create
    ActiveRecord::Base.transaction do
      post_params[:sub_posts_attributes].each do |sub_post_params|
        @post = Post.create!(sub_post_params)
        if @post.save
          flash[:notice] = "Post criado com sucesso!"
        end
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to root_path, notice: "O Post foi atualizado com sucesso" }

        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "O Post foi excluído com sucesso" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:dev_id, :description, :date, :status, :good_bad, sub_posts_attributes: [:dev_id, :description, :date, :status, :good_bad])
    end
end
