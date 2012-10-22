# This migration comes from blog_engine (originally 20120906123150)
class AddNameToComments < ActiveRecord::Migration
  def change
    add_column :comments, :name, :string
  end
end
