class QnasController < ApplicationController
  def index
       
       @qnas = Qna.none
 
      if params[:search]    
          query = params[:search].strip
          query_array = query.split(' ')
        
          if params[:option] == "ALL"
            query_array.each do |s|
              @qnas = Qna.where("title LIKE ? OR content LIKE ? OR code_content LIKE ?",  "%#{s}%","%#{s}%","%#{s}%").paginate(:page => params[:page],:per_page => 5).order('created_at DESC')
              @qnas = @qnas.uniq
            end
          elsif params[:option] == "Title"
            query_array.each do |s|
                @qnas = Qna.where("title LIKE ?","%#{s}%").paginate(:page => params[:page],:per_page => 5).order('created_at DESC')
            end
          elsif params[:option] == "Content"
            query_array.each do |s|
              @qnas = Qna.where("content LIKE ?", "%#{s}%").paginate(:page => params[:page],:per_page => 5).order('created_at DESC')
            end
          elsif params[:option] == "Code"
            query_array.each do |s|
              @qnas= Qna.where("code_content LIKE ?", "%#{s}%").paginate(:page => params[:page],:per_page => 5).order('created_at DESC')
            end

          end
          
          if @qnas.empty?
            flash[:notice] = "no result"
          end
          
      else
        @qnas = Qna.paginate(:page => params[:page],:per_page => 5).order('created_at DESC')
      end
    
  end


   def new
      @qna = Qna.new 
   end
  
  
  def edit
    @qna = Qna.find(params[:qna_id])
  
end

    def create
         @qna = Qna.new(post_params)
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
      @qna.update(post_params)
        @qna.user_id= current_user.id
        @qna.qna_user=current_user.nickname
        @qna.save
        redirect_to "/qnas/show/#{@qna.id}"
  
    end
    
      
  def index_all
    @qnas = Qna.all.order('created_at DESC')
  end
  def index_c
    @qnas = Qna.where("category = 'C/C++'").paginate(:page => params[:page],:per_page => 5).order('created_at DESC')
  end
  def index_py
    @qnas = Qna.where("category = 'PYTHON'").paginate(:page => params[:page],:per_page => 5).order('created_at DESC')
  end
  def index_java
    @qnas = Qna.where("category = 'JAVA'").paginate(:page => params[:page],:per_page => 5).order('created_at DESC')
  end
  def index_scratch
    @qnas = Qna.where("category = 'SCRATCH/ENTRY'").paginate(:page => params[:page],:per_page => 5).order('created_at DESC')
  end
  def index_html
    @qnas = Qna.where("category = 'HTML/CSS'").paginate(:page => params[:page],:per_page => 5).order('created_at DESC')
  end
  def index_etc
    @qnas = Qna.where("category = 'ETC'").paginate(:page => params[:page],:per_page => 5).order('created_at DESC')
  end
  
  
  # heeham's
  def ajax_index_c
    @qnas = Qna.where("category = 'c/c++'")
    @qnas = @qnas.as_json
    @qna1 = @qnas.first.as_json.to_s
    puts @qna1
  
  end
  
  
  
  private
     def post_params
      params.require(:qna).permit(:category, :title, :content, :code_content, :img)
     end
    
end


#노드트립 참고코드 // 내게시글만보기!
    # def index2
    
    #   @post2s = Post2.where(user_id: current_user)
    #   @post3s = Post3.where(user_id: current_user)
    # end
    
    