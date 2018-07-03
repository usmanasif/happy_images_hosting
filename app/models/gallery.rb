class Gallery < ApplicationRecord
  has_many :images

  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: lambda { |attributes| attributes['file'].blank? }

  validates :ip_address, presence: true
end
