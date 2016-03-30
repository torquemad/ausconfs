class Conference < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true, length: { minimum: 1, maximum: 100 }
  validates :summary, presence: true, length: { minimum: 1, maximum: 300 }
  validates :description, presence: true, length: { minimum: 1, maximum: 2000 }

end
