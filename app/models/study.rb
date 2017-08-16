class Study < ActiveRecord::Base
  belongs_to :user
  mount_uploader :teacher_img, TeacherImageUploader
end
