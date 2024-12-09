class Notice < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
end
