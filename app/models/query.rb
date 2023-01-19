class Query < ApplicationRecord
    validates :title, presence: true, length: { minimum: 1, maximum: 50 }
    has_many :options, dependent: :destroy
    belongs_to :user
end
