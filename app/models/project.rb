class Project < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true, length: { minimum: 8, maximum: 100 }
end
