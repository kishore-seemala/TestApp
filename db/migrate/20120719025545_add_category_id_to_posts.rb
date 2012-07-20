class AddCategoryIdToPosts < ActiveRecord::Migration

  def up

    # add_column :posts, :category_id , :integer

     category = Category.default

     Post.update_all(:category_id => category.id)

  end

  def down

     remove_column :posts, :category_id

  end

end
