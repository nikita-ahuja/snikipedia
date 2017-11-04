class Article < ApplicationRecord
  include Filterable
	# validates :title, presence: true
	# validates :body, presence: true
	# validates :summary, presence: true
	# validates :user_id, presence: true
	# validates :category_id, presence: true
  acts_as_taggable

	# has_many :article_tags
	# has_many :tags, through: :article_tags
	belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
	has_many :photos

  # scope :status, -> (status) { where status: status }
  # scope :location, -> (location_id) { where location_id: location_id }
  # scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
  scope :title, -> (title) { where("title like ?", "%#{title}%") }
  scope :body, -> (body) { where("body like ?", "%#{body}%") }
  scope :summary, -> (summary) { where("summary like ?", "%#{summary}%") }





  # def self.search(search)
  #   where("title LIKE ? OR body LIKE ? OR summary LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  # end

end
