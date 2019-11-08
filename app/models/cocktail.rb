class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, presence: true, uniqueness: true
  mount_uploader :photo, PhotoUploader

  def image
    if photo.present?
      photo
    else
      'http://unsplash.it/300/300'
    end
  end
end
