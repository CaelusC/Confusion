class Project < ApplicationRecord
  has many :memberships, dependent: :destroy
  has many :users, through: :memberships
  has many :sprints, dependent: :destroy
  has many :cards, dependent: :destroy
  has many :folders, dependent: :destroy
  has many :tags, dependent: :destroy
end
