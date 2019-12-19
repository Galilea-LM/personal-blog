class Report < ApplicationRecord
  has_rich_text :description
  enum type: %i[front back]
end
