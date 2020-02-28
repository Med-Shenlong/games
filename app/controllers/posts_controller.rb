class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  skip_before_action :only_signed_in, only: [:categories, :index, :show]


  def index

game_ids = current_user.followed_games.pluck(:id)

if game_ids.empty?

  @posts = []

else

@posts = Post.joins('INNER JOIN games_posts ON games_posts.post_id = posts.id').where("games_posts.game_id IN(#{game_ids.join(',')})")


  end
end


 def categories



@categories = Category.find_by_slug!(params[:slug])
@posts = Post.joins(:games).where(games: {category_id: @categories.id})

end



  def me
    @posts = current_user.posts.all
  end


  def show

@post = Post.find(params[:id])

end

  # GET /posts/new
  def new
    @post = current_user.posts.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }

      else
        format.html { render :new }

      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_path, notice: 'Post was successfully updated.' }

      else
        format.html { render :edit }

      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = current_user.posts.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      p = params.require(:post).permit(:name, :content, :image_file, game_ids: [])
      p[:game_ids] = current_user.games.where(id: p[:game_ids]).pluck(:id)
      p
    end
end
