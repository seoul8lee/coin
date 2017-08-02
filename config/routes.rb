Rails.application.routes.draw do
  
  devise_for :users
  root 'mains#index'
  get 'mains/index'
  get 'mains/intro'
  
  
  
  get 'qnas/index'
  get 'qnas/new'
  get 'qnas/show/:qna_id' => 'qnas#show'
  get 'qnas/create'
  get 'qnas/destroy/:qna_id' => 'qnas#destroy'
  get 'qnas/edit/:qna_id' => 'qnas#edit'
  
  get 'qna_replies/create/:qna_id' =>'qna_replies#create'
  get 'qna_replies/destroy/:qna_id/:qna_reply_id' => 'qna_replies#destroy'
  get 'qna_replies/new/:qna_id' =>'qna_replies#new'
  
  get 'offlines/index'
  get 'offlines/career'
  get 'offlines/coding'
  get 'offlines/career_new'
  get 'offlines/coding_new'


   get 'reviews' => 'reviews#index'
   get 'reviews/new'
   get 'reviews/create'
   get 'reviews/show/:id' => 'reviews#show'
   get 'reviews/show/:id/edit' => 'reviews#edit'


end
