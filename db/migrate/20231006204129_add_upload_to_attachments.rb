class AddUploadToAttachments < ActiveRecord::Migration[7.0]
  def change
    add_column :attachments, :upload, :string
  end
end
