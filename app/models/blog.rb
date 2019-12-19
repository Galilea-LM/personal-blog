# frozen_string_literal: true

class Blog < ApplicationRecord
  belongs_to :user
  has_one_attached :poster
  has_rich_text :rich_body
end
