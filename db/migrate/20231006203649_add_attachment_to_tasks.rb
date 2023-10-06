class AddAttachmentToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :attachment, :string
  end
end
