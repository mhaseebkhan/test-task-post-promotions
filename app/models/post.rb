class Post < ActiveRecord::Base

  validates_presence_of :content, :title, :url, :allowed_clicks
  validate :promotion_criteria
  default_scope order current_clicks: :desc

  validates :allowed_clicks, numericality: { :greater_than_or_equal_to => 1 }

  validates_format_of :url, with: URI::regexp, message: "should be http://www.example.com"

  belongs_to :user

  ## Validates that current clicks should not update
  #  after reaching allowed_clicks count.
  def promotion_criteria
    if current_clicks.present? && allowed_clicks.present?
      unless current_clicks <= allowed_clicks
        errors[:base] << "maximum promotion criteria achieved"
      end
    end
  end

end
