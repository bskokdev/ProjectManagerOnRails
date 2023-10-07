class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader  :avatar, AvatarUploader
  has_many :tasks, dependent: :restrict_with_error
  validates :first_name, :last_name, :email, presence: true

  # Returns the full name of the user
  #
  # @return [String]
  def full_name
    "#{first_name} #{last_name}"
  end
end
