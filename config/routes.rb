Rails.application.routes.draw do
  
  devise_for :users
  root 'mains#index'
  get 'mains/index'
  get 'mains/intro'
  
  
  
  get 'qnas/index'
  get 'qnas/new'
  get 'qnas/show'


  get 'offlines/index'
  get 'offlines/career'
  get 'offlines/coding'
  get 'offlines/career_new'
  get 'offlines/coding_new'


  get 'reviews/index'
  get 'reviews/show'
  get 'reviews/new'




end
