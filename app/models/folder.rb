class Folder < ApplicationRecord
  belongs_to :project
  has_many :notes, dependent: :destroy
end
