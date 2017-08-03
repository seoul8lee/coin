class ReviewsController < ApplicationController
 
  def index
    @reviews = Review.all
  end

  def teacher
    @reviews = Review.where("user_id = '1'")
  end
  
  def student
    @reviews = Review.where.not("user_id = '1'")
  end
  
  def review_career
    @reviews = Review.where("category = 'career'")
  end
  
  def review_coding
    @reviews = Review.where("category = 'coding'")
  end
  

  def show
    @review = Review.find(params[:review_id])
  end
  

  def new
  end
  
  def edit
        @review = Review.find(params[:id])
  end
  
  def create
        @review = Review.new 
        @review.title = params[:input_title]
        @review.category = params[:input_category]
        @review.team_name = params[:input_team_name]
        @review.content = params[:input_content]
        @review.secret = params[:input_secret]
        @review.user = current_user
        @review.save
        redirect_to "/reviews"
  end
  
  def update
        @review = Review.find(params[:review_id])
        @review.update(params.require(:review).permit(:title, :category, :team_name, :content, :secret))
        redirect_to @review
  end
    
end


