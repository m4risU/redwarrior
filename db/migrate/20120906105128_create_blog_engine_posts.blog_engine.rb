# This migration comes from blog_engine (originally 20120906090021)
class CreateBlogEnginePosts < ActiveRecord::Migration
  def change
    create_table :blog_engine_posts do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
