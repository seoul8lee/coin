class QnasController < ApplicationController
  def index
    @qnas = Qna.all

  end

  def new
  end
  
  def edit
    @qna = Qna.find(params[:qna_id])
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
        @qna = Qna.find(params[:qna_id]) #죠아아
    end
    
   def destroy
        @qna = Qna.find(params[:qna_id])
        @qna.destroy
       redirect_to "/qnas/index"
    end
    
    def update
      @qna = Qna.find(params[:qna_id])
      @qna.update
      redirect_to "/qnas/index"
      end

end


#노드트립 참고코드 // 내게시글만보기!
    # def index2
    
    #   @post2s = Post2.where(user_id: current_user)
    #   @post3s = Post3.where(user_id: current_user)
    # end