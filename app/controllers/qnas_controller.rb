class QnasController < ApplicationController
  def index
    @qnas = Qna.all

  end

  def new
  end
  
    def create
        @qna = Qna.new 
        @qna.title = params[:input_title]
        @qna.category = params[:input_category]
        @qna.content = params[:input_content]
        @qna.code_content = params[:input_code_content]
        @qna.img = params[:input_img]
        @qna.save
        redirect_to "/qnas/show/#{@qna.id}"
    end

  def show
  end
end
