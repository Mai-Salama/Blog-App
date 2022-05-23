class Blog < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: "user_id"
  has_many :comments, dependent: :destroy
  has_many :tags, dependent: :destroy
  accepts_nested_attributes_for :tags

  #validate :at_least_one_tag

  #after_commit :delete_blog, on: :create 

  def user_is_author?(current_user_id)
    current_user_id == user_id 
  end

  # def delete_blog
  #   DeleteBlog.perform_in(24.hours, id)
  # end

  def at_least_one_tag
    errors.add(:blog, 'Should have at least one tag') if tags.empty?
  end
  
end
