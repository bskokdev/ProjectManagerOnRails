class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader  :avatar, AvatarUploader
  has_many :tasks, dependent: :restrict_with_error
  def full_name
    "#{first_name} #{last_name}"
  end
end
