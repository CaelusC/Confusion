class CardDependency < ApplicationRecord
  belongs_to :blocking_card
  belongs_to :blocked_card
end
