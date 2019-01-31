class UpFile < ApplicationRecord
  has_secure_password

  has_many_attached :files

  validates :name, presence: true
end
