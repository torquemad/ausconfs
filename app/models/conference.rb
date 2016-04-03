class Conference < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true, length: { minimum: 1, maximum: 100 }
  validates :summary, presence: true, length: { minimum: 1, maximum: 300 }
  validates :description, presence: true, length: { minimum: 1, maximum: 2000 }
  validate :image_size

  mount_uploader :picture, PictureUploader

  private

  def image_size
    if picture.size > 5.megabytes
      errors.add(:picture, "Image size too large (over 5mb)")
    end
  end

end
