class CreateViews < ActiveRecord::Migration
  def change
    create_table    :views do |t|
      t.refereces   :user
      t.refereces   :note

      t.timestamps
    end
  end
end