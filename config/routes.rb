Rails.application.routes.draw do
  
  devise_for :users
  root 'mains#index'
  get 'mains/index'
  get 'mains/intro'
  
  
  
  get 'qnas/index'
  get 'qnas/index_c' 
  get 'qnas/index_py'
  get 'qnas/index_java'
  get 'qnas/index_scratch'
  get 'qnas/index_html'
  get 'qnas/index_etc' 
  get 'qnas/new'
  get 'qnas/show/:qna_id' => 'qnas#show'
  get 'qnas/create'
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
  get 'offlines/create'
  

   get 'reviews' => 'reviews#index'
   get 'reviews/teacher'
   get 'reviews/student'
   get 'reviews/review_career'
   get 'reviews/review_coding'
   get 'reviews/new'
   get 'reviews/create'
   get 'reviews/show/:review_id' => 'reviews#show'
   get 'reviews/edit/:review_id/' => 'reviews#edit'
   get 'reviews/update/:review_id/' => 'reviews#update'

   post 'reviews/update/:review_id/' => 'reviews#update'


   get 'review_replies/create/:review_id' =>'review_replies#create'
   get 'review_replies/destroy/:review_id/:review_reply_id' => 'review_replies#destroy'
   
end
