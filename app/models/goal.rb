class Goal < ActiveRecord::Base
  validates :body, presence: true
  validates :private_goal, :completed, inclusion: { in: [true, false] }

  belongs_to :user
  has_many :cheers
  has_many :cheerers, through: :cheers, source: :user

  include Commentable

end
