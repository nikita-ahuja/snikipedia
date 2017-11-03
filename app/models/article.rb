class Article < ApplicationRecord
	# validates :title, presence: true
	# validates :body, presence: true
	# validates :summary, presence: true
	# validates :user_id, presence: true
	# validates :category_id, presence: true
  acts_as_taggable

	# has_many :article_tags
	# has_many :tags, through: :article_tags
	belongs_to :user
	#belongs_to :category
  has_many :article_categories
  has_many :categories, through: :article_categories
	has_many :photos

  def self.search(search)
    where("title LIKE ? OR body LIKE ? OR summary LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end

end
