class Card < ApplicationRecord
  belongs_to :project
  belongs_to :sprint, optional: true
  has_many :card_tags, dependent: :destroy
  has_many :tags, through: :card_tags
  has_many :blocking_dependencies, class_name: "CardDependency", foreign_key: :blocked_card_id, dependent: :destroy
  has_many :blocking_dependencies, class_name: "CardDependency", foreign_key: :blocking_card_id, dependent: :destro
  has_many :blocks, through: :blocking_dependencies, source: :blocked_card
  has_many :blocked_by, through: :blocking_dependencies, source: :blocking_card
end
