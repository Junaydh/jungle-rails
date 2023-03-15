class Sale < ApplicationRecord
  validates :name, presence: true
  validates :percent_off, presence: true
  validates :starts_on, presence: true
  validates :ends_on, presence: true

  def self.active
    where("starts_on <= ? AND ends_on >= ?", Date.today, Date.today)
  end
  def upcoming?
    starts_on > Date.today
  end

  def active?
    starts_on <= Date.today && ends_on >= Date.today
  end

  def finished?
    ends_on < Date.today
  end

end
