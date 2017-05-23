class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: [:release_year, :artist_name] }
  validates :release_year, presence: true, if: :released?, numericality: { less_than_or_equal_to: Time.now.year }

  def released?
    released == true
  end
end
