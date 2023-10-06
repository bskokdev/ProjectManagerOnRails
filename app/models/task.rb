class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :attachments, dependent: :destroy

  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true

  enum status: { 'New': 0, 'Being resolved': 1, 'Waiting for client': 2, 'Done': 3 }

  after_initialize :set_default_status, if: :new_record?

  validates :subject, :status, :user_id, :project_id, presence: true

  private

  def set_default_status
    self.status ||= 0
  end
end
