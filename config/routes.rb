Rails.application.routes.draw do
    
    devise_for :users
    
    root 'mains#index'
    
    get 'mains/index'
    get 'mains/intro'
    get 'mypages/index'
    
    resources :qnas do
        resources :qna_replies do
            member do
                get 'choose'
            end
        end
        collection do
            get :index_c
            get :index_py
            get :index_java
            get :index_scratch
            get :index_html
            get :index_all
            get :index_etc
        end
    end
    
    # heeham's
    post 'qnas/index_c' => 'qnas#ajax_index_c'
    
    
    get 'offlines/index'
    get 'offlines/career'
    get 'offlines/coding'
    get 'offlines/career_new'
    get 'offlines/coding_new'
    post 'offlines/create'
    
    
    resources :reviews do
        resources :review_replies
        collection do
            get :teacher
            get :review_career
            get :review_coding
        end
    end
    
    
     resources :studies do
        member do
            get 'apply'
          
        end
        collection do
            get :index_hot
            get :index_last
        end
    end
    
    get 'studies/:study_id/apply_d/:apply_id'=>'studies#apply_d'
    
    resources :suggests
    
    
    #   mount RailsDb::Engine => '/coinkiyom', :as => 'rails_db'
    
    get 'studies/coiner99'
    
end
