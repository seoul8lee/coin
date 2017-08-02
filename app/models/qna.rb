class Qna < ActiveRecord::Base
    belongs_to :user
    has_many :qna_replies, dependent: :destroy
    
def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end


end
