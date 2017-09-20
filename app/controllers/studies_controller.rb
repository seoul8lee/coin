class StudiesController < ApplicationController
    
    def index
        @studies=Study.all.order('created_at DESC')
    end
    
     def index_hot
        @studies=Study.all.order('created_at DESC')
        @applies=Apply.all
    end
     def index_last
        @studies=Study.all.order('created_at DESC')
        @applies=Apply.all
    end
    
    def apply
        @study = Study.find(params[:id])
        @apply=Apply.new
        @apply.user_id=current_user.id
        @apply.study_id=@study.id
        @apply.student_name=current_user.name
        @apply.save
        redirect_to "/studies/#{@study.id}"
    end
    
     def apply_d
        @study = Study.find(params[:study_id])
        @apply = Apply.find(params[:apply_id])
        @apply.destroy
        redirect_to "/studies/#{@study.id}"
    end
    
    def new
        @study=Study.new
    end
    
    
    def create
        @study = Study.new(post_params)
        @study.user_id = current_user.id
        @study.study_pass=false
        @study.save
        redirect_to "/studies/#{@study.id}"
    end
    
    def show
        @study = Study.find(params[:id])
        @apply= Apply.where(study_id: params[:id])
    end
    
    def edit
        @study = Study.find(params[:id])
    end
    
    def update
        @study = Study.find(params[:id])
        @study.update(post_params)
        @study.user_id = current_user.id
        @study.save
        redirect_to "/studies/#{@study.id}"
    end
    
    def destroy
        @study = Study.find(params[:study_id])
        @study.destroy
       redirect_to "/studies"
    end
    
    
    def coiner99
       @users = User.all
       @studies=Study.all
       @applies = Apply.all
        
      end
    
    private
     def post_params
      params.require(:study).permit(:study_name, :study_time, :study_content, :study_pay, :study_max, :study_due, :teacher_img, :teacher_intro, :study_pass)
     end
    
end
