# This migration comes from blog_engine (originally 20120906124838)
class AddNameToBlogEngineComments < ActiveRecord::Migration
  def change
    add_column :blog_engine_comments, :name, :string
  end
end
