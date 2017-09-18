class MypagesController < ApplicationController

    def index
        @qnas = Qna.all
        @reviews = Review.all
        @applies = Apply.where(user_id: current_user.id)
        @studies = Study.all
        @offlines = Offline.all
    end

end
