# This migration comes from blog_engine (originally 20120911100247)
class AddImageToBlogEnginePosts < ActiveRecord::Migration
  def change
    add_column :blog_engine_posts, :image, :string
  end
end
