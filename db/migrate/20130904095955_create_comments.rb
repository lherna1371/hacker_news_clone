class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :post
      t.belongs_to :user
      t.text    :content, :null => false

      t.timestamps
    end
  end
end
