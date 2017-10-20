class Group < ActiveRecord::Base
  belongs_to :user
  has_many :joins, dependent: :destroy
  has_many :users, through: :joins

  validates :description, presence: true
  validates_length_of :name, :minimum => 5
end
