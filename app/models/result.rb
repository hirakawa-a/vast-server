class Result < ApplicationRecord
    validates :count_start, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :count_end, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :campaign_id, presence: true
    validates :cuepoint_id, presence: true
    
    belong_to :campaign
    belong_to :cuepoint
end
