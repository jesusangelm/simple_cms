class Section < ActiveRecord::Base

  belongs_to :page
  has_many :section_edits
  has_many :editors, :through => :section_edits,
    :class_name => "AdminUser"

  acts_as_list :scope => :page

  #callback
  after_save :touch_page

  CONTENT_TYPE = ["text", "HTML"]

  validates :name, presence: true,
    length: { maximum: 255 }
  #validates :content_type, in: CONTENT_TYPE,
  #                         message: "must be one of: #{CONTENT_TYPE.join(", ")}"
  validates :content, presence: true

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("sections.position ASC") }
  scope :newest_first, lambda { order("sections.created_at DESC")}

  private

  def touch_page
    # touch es similar a:
    # subject.update_attribute(:updated_at, Time.now)
    page.touch
  end
end
