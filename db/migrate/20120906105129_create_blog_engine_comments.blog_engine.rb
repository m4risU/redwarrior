# This migration comes from blog_engine (originally 20120906090950)
class CreateBlogEngineComments < ActiveRecord::Migration
  def change
    create_table :blog_engine_comments do |t|
      t.integer :post_id
      t.text :text

      t.timestamps
    end
  end
end
