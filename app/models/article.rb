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
  has_many :article_categories
  has_many :categories, through: :article_categories
	has_many :photos

  # WITH PG SEARCH GEM
  include PgSearch
  pg_search_scope :search, against: [:title, :summary],
  using: {tsearch: {dictionary: "english"}},
  associated_against: {user: :username, categories: [:name, :description]}

  def self.text_search(query)
    if query.present?
      search(query)
    else
      where(nil)
    end
  end

  ########################

  # WITHOUT GEM
  # def self.text_search(query)
  #   if query.present?
  #     # where("name @@ :q or content @@ :q", q: query)
  #     # where("title @@ :q or summary @@ :q", q: "%#{query}%")
  #     where("title @@ :q or summary @@ :q", q: "%#{query}%")
  #   else
  #     where(nil)
  #   end
  # end

  ########################

  # ORIGINAL SEARCH
  # def self.search(search)
  #   where("title LIKE ? OR body LIKE ? OR summary LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  # end

end
