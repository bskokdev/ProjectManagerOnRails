class Attachment < ApplicationRecord
  belongs_to :task
  mount_uploader :upload, AttachmentUploader
end
