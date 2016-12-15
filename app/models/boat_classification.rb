class BoatClassification < ActiveRecord::Base
  belongs_to :boat
  belongs_to :classification

  def self.multiple_classification
    self.select(boat_id).group(boat_id).where('count > 1')
  end


end
