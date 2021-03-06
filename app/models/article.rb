# frozen_string_literal: true

# A model for an Article instance
class Article < ApplicationRecord
  validates :title, length: { minimum: 3, maximum: 50 }
  validates :description, length: { minimum: 10, maximum: 2000 }

  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :comments
end
