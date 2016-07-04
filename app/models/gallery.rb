class Gallery < ApplicationRecord
  has_many :paintings, inverse_of: :gallery
  belongs_to :primary_painting, class_name: 'Painting', required: false
  accepts_nested_attributes_for :paintings, reject_if: :all_blank, allow_destroy: true

  before_validation :primary_painting_setup

  private

  def primary_painting_setup
    puts "candidate: #{paintings.select(&:primary?).first}"
    self.primary_painting = paintings.any? ? paintings.select(&:primary?).first || paintings.first : nil
  end
end
