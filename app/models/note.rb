class Note < ActiveRecord::Base
  belongs_to  :user
  has_many :views

  def who_has_seen
    views.map(&:user)
   end

end

