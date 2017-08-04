class ReviewsController < ApplicationController
 
  def index
    
     @reviews = Review.all
      
          # if params[:option] == "all"
          #     @reviews = Review.all
          # elsif params[:option] == "teacher"
          #     @reviews = Review.where("user_id = '1'")
          # elsif params[:option] == "student"
          #     @reviews = Review.where.not("user_id = '1'")
          # elsif params[:option] == "review_career"
          #     @reviews = Review.where("category = 'career'")
          # elsif params[:option] == "review_coding"
          #     @reviews = Review.where("category = 'coding")
          # end
        
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
        @review = Review.find(params[:review_id])

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
        redirect_to "/reviews/show/#{@review.id}"
  end
  
  def update
        @review = Review.find(params[:review_id])
        @review.title = params[:input_title]
        @review.category = params[:input_category]
        @review.team_name = params[:input_team_name]
        @review.content = params[:input_content]
        @review.secret = params[:input_secret]
        @review.user = current_user
        @review.save
        redirect_to "/reviews/show/#{@review.id}"
  end
    
end


