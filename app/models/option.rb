class Option < ApplicationRecord
  validates :title, presence: true
  belongs_to :query
end
