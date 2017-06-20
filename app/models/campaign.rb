class Campaign < ApplicationRecord
    has_many :campaign_cuepoints
    has_many :cuepoints, through: :campaign_cuepoints 
    has_one :result
    validates_datetime :end_at, on_or_after: :start_at
    validates :name, length: { in: 5..20}
    validates :limit_start, numericality: {only_integer: true, greater_than: 0, less_than: 10000}
    validates :movie_url, length: { in: 5..100 }
end
