class Note < ActiveRecord::Base
  belongs_to  :user
  has_many :views

  validates :user, presence: true


  def who_has_seen
    views.map(&:user)
   end



end

