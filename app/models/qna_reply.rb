class QnaReply < ActiveRecord::Base
  belongs_to :qna
  mount_uploader :img, ReplyImageUploader
end
