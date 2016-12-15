class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    self.joins(boats: :classifications).where("classifications.name = 'Catamaran'")
  end

  def self.sailors
    self.joins(boats: :classifications).where("classifications.name = 'Sailboat'").distinct
  end

  def self.talented_seamen
    self.joins(boats: :classifications).where("classifications.name = 'Motorboat' AND captains.id  IN (?)", self.sailors.ids)
  end

  def self.non_sailors
    self.joins(boats: :classifications).where("captains.id NOT IN (?)",self.sailors.ids).distinct
  end
end


#group('captains.id').having
