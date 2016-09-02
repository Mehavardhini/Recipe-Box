class Recipe < ActiveRecord::Base
  has_many :ingredients
  has_many :directions
  belongs_to :user

  accepts_nested_attributes_for :ingredients,
                                reject_if: proc { |attributes| attributes["name"].blank? },
                                allow_destroy: true

  accepts_nested_attributes_for :directions,
                                reject_if: proc { |attributes| attributes["step"].blank? },
                                allow_destroy: true

  has_attached_file :image
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  do_not_validate_attachment_file_type :image
end
