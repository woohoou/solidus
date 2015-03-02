class Spree::PromotionCode < ActiveRecord::Base
  belongs_to :promotion, inverse_of: :promotion_code
  has_many :adjustments

  validates :usage_limit, numericality: { greater_than: 0, allow_nil: true }
  validates :value, presence: true, uniqueness: true
  validates :promotion, presence: true

  before_save :downcase_value

  private

  def downcase_value
    self.value = value.downcase
  end
end