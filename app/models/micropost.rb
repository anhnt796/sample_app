class Micropost < ApplicationRecord
  belongs_to :user
  default_scope ->{order(created_at: :desc)}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.micropost.content.length.MAXIMUM}
  validate :picture_size

  private

  def picture_size
    return unless picture.size > Settings.picture.size.MAXIMUM.megabytes
    errors.add :picture, I18n.t("microposts.picture.too_high",
      size: Settings.picture.size.MAXIMUM)
  end
end
