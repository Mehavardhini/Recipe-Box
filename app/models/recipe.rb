class Recipe < ActiveRecord::Base
  has_many :ingredients, dependent: :destroy
  has_many :directions, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :ingredients, :presence => true
  validates :directions, :presence => true

  accepts_nested_attributes_for :ingredients,
                                reject_if: proc { |attributes| attributes["name"].blank? },
                                allow_destroy: true

  accepts_nested_attributes_for :directions,
                                reject_if: proc { |attributes| attributes["step"].blank? },
                                allow_destroy: true

  has_attached_file :image,:default_url => 'default.jpg'
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  do_not_validate_attachment_file_type :image
end
