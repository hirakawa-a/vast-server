class Cuepoint < ApplicationRecord
    has_many :campaign_cuepoints, dependent: :destroy
    has_many :campaigns, through: :campaign_cuepoints
    has_many :results, foreign_key: 'id', dependent: :destroy
    
    validates :name, length: {in: 5..20}
    validates :name, uniqueness: true
end
