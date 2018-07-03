class Gallery < ApplicationRecord
  validates :ip_address, presence: true
end
