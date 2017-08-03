class Review < ActiveRecord::Base
    has_many :review_replies, dependent: :destroy
    belongs_to :user
 end
