class QnaRepliesController < ApplicationController

    def create
        @qna = Qna.find(params[:qna_id])
        @qna_reply=@qna.qna_replies.build
        @qna_reply.qna_reply_user = current_user.nickname
        @qna_reply.content = params[:input_content]
        @qna_reply.code_content = params[:input_code_content]
        @qna_reply.img = params[:input_img]
        @qna_reply.user_id= current_user.id
        @qna_reply.save
       
        redirect_to "/qnas/show/#{@qna.id}"
    end
    
    def new
        @qna = Qna.find(params[:qna_id])
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
end
