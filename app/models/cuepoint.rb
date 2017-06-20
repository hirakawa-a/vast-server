class Cuepoint < ApplicationRecord
    has_many :campaign_cuepoints
    has_many :campaigns, through: :campaign_cuepoints
    has_one :result
    
    validates :name, length: {in: 5..20}
    validates :name, uniqueness: true
    
    
end
