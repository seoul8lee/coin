class QnaRepliesController < ApplicationController

    def create
        @qna = Qna.find(params[:qna_id])
        @qna_reply = @qna.qna_replies.create(reply_params)
        @qna_reply.qna_reply_user = current_user.nickname
        @qna_reply.user_id= current_user.id
        @qna_reply.save
       
        redirect_to "/qnas/show/#{@qna.id}"
    end
    
    def todo
        
    end

    def destroy
    @qna = Qna.find(params[:qna_id])
    @qna_reply = @qna.qna_replies.find(params[:qna_reply_id])
    @qna_reply.destroy
    redirect_to "/qnas/show/#{@qna.id}"
  end
  
  def choose
    @qna = Qna.find(params[:qna_id])
    @qna.choice=params[:qna_reply_id]
    @qna.save
    redirect_to "/qnas/show/#{@qna.id}"
    
    
  end

 private
    def reply_params
        params.require(:qna_reply).permit(:content,:code_content, :img)
    end
    

end
