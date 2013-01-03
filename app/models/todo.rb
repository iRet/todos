class Todo < ActiveRecord::Base
  attr_accessible :priority, :title
  belongs_to :user

  validates :title, :presence => { :message => "Title is required" }

  def priority_title
    ['low', 'normal', 'high'][priority] rescue priority
  end
end
