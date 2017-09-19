class QnaRepliesController < ApplicationController

    def create
        @qna = Qna.find(params[:qna_id])
        @qna_reply = @qna.qna_replies.create(reply_params)
    if current_user.nil?     
        @qna_reply.qna_reply_user = current_user.nickname
        @qna_reply.user_id= current_user.id
    end
        @qna_reply.save
       
        redirect_to "/qnas/#{@qna.id}"
    end
    
    def todo
        
    end

    def destroy
    @qna = Qna.find(params[:qna_id])
    @qna_reply = @qna.qna_replies.find(params[:id])
    @qna_reply.destroy
    redirect_to "/qnas/#{@qna.id}"
  end
  
  def choose
    @qna = Qna.find(params[:qna_id])
    @qna.choice=params[:id]
    @qna.save
    redirect_to "/qnas/#{@qna.id}"
  end

 private
    def reply_params
        params.require(:qna_reply).permit(:content,:code_content, :img)
    end
    

end
