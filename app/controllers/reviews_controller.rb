class ReviewsController < ApplicationController
 
  def index
    
     @reviews = Review.paginate(:page => params[:page],:per_page => 10).order('created_at DESC')
      
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
    @reviews = Review.where("user_id = '1'").paginate(:page => params[:page],:per_page => 10).order('created_at DESC')
  end
  
  def student
    @reviews = Review.where.not("user_id = '1'").paginate(:page => params[:page],:per_page => 10).order('created_at DESC')
  end
  
  def review_career
    @reviews = Review.where("category = 'career'").paginate(:page => params[:page],:per_page => 10).order('created_at DESC')
  end
  
  def review_coding
    @reviews = Review.where("category = 'coding'").paginate(:page => params[:page],:per_page => 10).order('created_at DESC')
  end
  

  def show
    @review = Review.find(params[:id])
  end
  

  def new
    @review = Review.new
  end
  
  def edit
        @review = Review.find(params[:id])

  end
  
  
  def create
    Review.create(title: params[:title], category: params[:category], team_name: params[:team_name], content: params[:content], secret: params[:secret], user: current_user)
    redirect_to "/reviews/"
  end
  
  def update
        @review = Review.find(params[:id])
        @review.update_attributes(title: params[:title], category: params[:category], team_name: params[:team_name], content: params[:content], secret: params[:secret])
        redirect_to "/reviews/#{@review.id}"
  end
    
    
  def destroy
        @review = Review.find(params[:id])
        @review.destroy
       redirect_to "/reviews"
  end
    
    
end


