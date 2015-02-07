class View < ActiveRecord::Base
  has_many  :users
  has_many  :views
end
