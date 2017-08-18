class MypagesController < ApplicationController

    def index
        @qnas = Qna.where(user_id: current_user)
        @reviews = Review.where(user_id: current_user)
        @applies = Apply.where(user_id: current_user)
        @studies = Study.all
        @offlines = Offline.where(user_id: current_user)
       @users = User.all
    end

end
