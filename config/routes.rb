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

  get 'offlines/index'
  get 'offlines/career'
  get 'offlines/coding'
  get 'offlines/career_new'
  get 'offlines/coding_new'


  get 'reviews/index'
  get 'reviews/show'
  get 'reviews/new'




end
