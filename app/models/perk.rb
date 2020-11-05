class Perk < ApplicationRecord
  belongs_to :idea

  has_many :donations
  has_many :users

  def total_donations
    donations.reduce(0){ |acc, cont| acc + cont.amount }
  end

  def donations_count
    donations.map{ |e| e.donor_id }.uniq.count
  end

end
