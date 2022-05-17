# frozen_string_literal: true

# A model for an Article instance
class Comment < ApplicationRecord
  validates :content, presence: true, length: { minimum: 10, maximum: 2000 }

  belongs_to :article
end
