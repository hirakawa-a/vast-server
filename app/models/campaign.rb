class Campaign < ApplicationRecord
    has_many :campaign_cuepoints, dependent: :destroy
    has_many :cuepoints, through: :campaign_cuepoints
    has_many :results, foreign_key: 'id'
    
    
    validates_datetime :end_at, on_or_after: :start_at
    validates :name, length: { in: 5..20}
    validates :name, uniqueness: true  
    validates :limit_start, numericality: {only_integer: true, greater_than: 0, less_than: 10000}
    validates :movie_url, length: { in: 5..100 }
    
    def self.current_available(cuepoint)
        campaigns = cuepoint.campaigns.where("start_at <= '#{Time.now}' AND end_at >= '#{Time.now}'").to_a
        campaigns.delete_if do |campaign|
            result = Result.where(campaign: campaign, cuepoint: @cuepoint).first
            !result.blank? && result.count_start >= campaign.limit_start 
        end
    end
end
