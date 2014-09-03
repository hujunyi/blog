class AddInitialCategories < ActiveRecord::Migration
  def up
    Category.create(name: "Life")
    Category.create(name: "Programming")
  end
  def down
    Category.delete_all
  end
end
