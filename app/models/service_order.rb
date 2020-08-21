class ServiceOrder < ApplicationRecord
    belongs_to :service
    belongs_to :buyer

    validates :service, presence: true
    validates :buyer, presence: true
end
