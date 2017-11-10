class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence:true
# released should be true or false
# validates :released, boolean:true
  # validates :released, inclusion: {in: %w(true false)} ##This breaks for good records
# title should be unique intersected with artist_name and release_year



  # release_year should be optional if released is false
  validates :release_year, presence: true, if: :released?

  def released?
    released == true
  end

  # release_year presence: true if released is true

  #
  # class Order < ApplicationRecord
  #   validates :card_number, presence: true, if: :paid_with_card?
  #
  #   def paid_with_card?
  #     payment_type == "card"
  #   end
  # end
#
# validates :title, presence: true
# validates :content, length: { minimum: 100 }
# validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
end
