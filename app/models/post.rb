class Post < ApplicationRecord
  belongs_to :dev
  validates :description, :status, :good_bad, presence: true
end