class CreateAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :attachments do |t|
      t.text :description
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
