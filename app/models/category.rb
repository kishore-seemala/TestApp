class Category < ActiveRecord::Base

  attr_accessible :category

  default_scope :order => "created_at DESC"

  has_many :posts
  
  validates :category, :presence => true

  def self.default

     find_or_create_by_category("Article")

  end

  after_destroy do

     manage_posts

  end

  def manage_posts

     posts.each do |post|

       post.update_attribute(:category_id, Category.default.id)

     end

  end

end
