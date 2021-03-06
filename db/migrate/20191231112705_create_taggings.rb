# frozen_string_literal: true

class CreateTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings do |t|
      t.references :tag, foreign_key: true
      # t.integer :tag_id, foreign_key: true

      t.references :post, foreign_key: true
      # t.integer :post_id, foreign_key: true
      t.timestamps
    end
  end
end
