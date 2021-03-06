class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	before_action :authenticate_user!, except: [:index, :show]


	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
		@post = Post.friendly.find(params[:id])
	end

	def update
		@post = Post.friendly.find(params[:id])
		if @post.update(post_params)
				redirect_to @post
		else
			render 'edit'
		end

	end


	def destroy
		@post.destroy
		redirect_to root_path

	end

	def index
		if params[:tag]
			@posts = Post.tagged_with(params[:tag])
		else
			@posts = Post.all.order("created_at DESC")
		end

	end

	def show
	end

	def upvote
		@post.upvote_by current_user
		redirect_to @post
	end

	def downvote
		@post.downvote_by current_user
		redirect_to @post
	end

	private

	def uniqueness_post_title
		if post.title.where(title: self.title).exists?
      errors.add(:title, "Title exists")
    end
  end

	def find_post
		@post = Post.friendly.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body, :description, :preview, :tag_list)
	end
end
