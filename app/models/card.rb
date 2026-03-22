class Card < ApplicationRecord
  belongs_to :project
  belongs_to :sprint
end
