class CreateViews < ActiveRecord::Migration
  def change
    create_table    :views do |t|
      t.references  :user
      t.references  :note

      t.timestamps
    end
  end
end