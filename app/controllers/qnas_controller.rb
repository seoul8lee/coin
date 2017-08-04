class QnasController < ApplicationController
  def index
       
       @qnas = Qna.none
 
      if params[:search]    
          query = params[:search].strip
          query_array = query.split(' ')
        
          if params[:option] == "ALL"
            query_array.each do |s|
              @qnas += Qna.where("title LIKE ? OR content LIKE ?", "%#{s}%","%#{s}%")
              @qnas = @qnas.uniq
            end
          elsif params[:option] == "Title"
            query_array.each do |s|
                @qnas += Qna.where("title LIKE ?","%#{s}%")
            end
          elsif params[:option] == "Content"
            query_array.each do |s|
              @qnas += Qna.where("content LIKE ?", "%#{s}%")
            end
          elsif params[:option] == "Code"
            query_array.each do |s|
              @qnas += Qna.where("code_content LIKE ?", "%#{s}%")
            end

          end
          
          if @qnas.empty?
            flash[:notice] = "no result"
          end
          
      else
        @qnas = Qna.all
      end
    
  end


  def new
  end
  
  def edit
    @qna = Qna.find(params[:qna_id])
    @qna.title = params[:input_title]
        @qna.category = params[:input_category]
        @qna.content = params[:input_content]
        @qna.code_content = params[:input_code_content]
        @qna.img = params[:input_img]
     @qna.save
    redirect_to "/qnas/show/#{@qna.id}"
  
end

    def create
        @qna = Qna.new 
        @qna.title = params[:input_title]
        @qna.category = params[:input_category]
        @qna.content = params[:input_content]
        @qna.code_content = params[:input_code_content]
        @qna.img = params[:input_img]
        @qna.user_id= current_user.id
        @qna.qna_user=current_user.nickname
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
  
  def index_c
    @qnas = Qna.where("category = 'c/c++'")
  end
  def index_py
    @qnas = Qna.where("category = 'python'")
  end
  def index_java
    @qnas = Qna.where("category = 'java'")
  end
  def index_scratch
    @qnas = Qna.where("category = 'scratch/entry'")
  end
  def index_html
    @qnas = Qna.where("category = 'html/css'")
  end
  def index_etc
    @qnas = Qna.where("category = 'etc'")
  end
  
end


#노드트립 참고코드 // 내게시글만보기!
    # def index2
    
    #   @post2s = Post2.where(user_id: current_user)
    #   @post3s = Post3.where(user_id: current_user)
    # end