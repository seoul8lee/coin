Rails.application.routes.draw do
  
  resources :suggests
  resources :suggests
  resources :suggests
  devise_for :users
  root 'mains#index'
  get 'mains/index'
  get 'mains/intro'
  
  
  
  # heeham's
  post 'qnas/index_c' => 'qnas#ajax_index_c'
  
  #
  get 'qnas' => 'qnas#index'
  get 'qnas/index'
  get 'qnas/index_c' 
  get 'qnas/index_py'
  get 'qnas/index_java'
  get 'qnas/index_scratch'
  get 'qnas/index_html'
  get 'qnas/index_all' 
  get 'qnas/index_etc' 
  get 'qnas/new'
  get 'qnas/show/:qna_id' => 'qnas#show'
  post 'qnas/create'
  post 'qnas/update/:qna_id' => 'qnas#update'
  get 'qnas/destroy/:qna_id' => 'qnas#destroy'
  get 'qnas/edit/:qna_id' => 'qnas#edit'
  
  get 'qna_replies/create/:qna_id' =>'qna_replies#create'
  get 'qna_replies/destroy/:qna_id/:qna_reply_id' => 'qna_replies#destroy'
  get 'qna_replies/new/:qna_id' =>'qna_replies#new'
  get 'qna_replies/choose/:qna_id/:qna_reply_id' => 'qna_replies#choose'
  
  get 'offlines/index'
  get 'offlines/career'
  get 'offlines/coding'
  get 'offlines/career_new'
  get 'offlines/coding_new'
  post 'offlines/create'
  
  get 'studies/index'
  get 'studies/new'
  get 'studies/apply/:study_id'=>'studies#apply'
   get 'studies/apply_d/:study_id/:apply_id'=>'studies#apply_d'
  get 'studies/show/:study_id' => 'studies#show'
  post 'studies/create'
  post 'studies/update/:study_id' => 'studies#update'
  get 'studies/destroy/:study_id' => 'studies#destroy'
  get 'studies/edit/:study_id' => 'studies#edit'
  
  
   resources :qnas do
    resources :qna_replies
  end

  
  
  resources :reviews do
      resources :review_replies 
      collection do
        get :teacher
        get :review_career
        get :review_coding
        end
  end
  
  

  
  
end
