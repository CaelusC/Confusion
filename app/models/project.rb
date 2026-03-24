class Project < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :sprints, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_many :folders, dependent: :destroy
  has_many :tags, dependent: :destroy
end
