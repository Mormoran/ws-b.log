# frozen_string_literal: true

# A model for an Article instance
class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 2000 }

  has_many :comments, dependent: :destroy
end
