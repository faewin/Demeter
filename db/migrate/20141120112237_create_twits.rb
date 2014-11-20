class CreateTwits < ActiveRecord::Migration
  def change
    create_table :twits do |t|
      t.string :message
      t.belongs_to :user

      t.timestamps
    end
  end
end
