require 'open-uri'

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


  ########################

  # SEARCH WITH PG SEARCH GEM
  include PgSearch
  pg_search_scope :search_any_word, against: [:title, :summary],
  using: {tsearch: {dictionary: "english", any_word: :true}},
  associated_against: {user: :username, categories: [:name, :description], tags: :name, photos: :title}

  def self.text_search(query)
    if query.present?
      search_any_word(query)
    else
      where(nil)
    end
  end

  # def picture_from_url(url)
  #   self.photos << open(url)
  #   self.photos <<
  # end


  ########################

  # SEARCH WITHOUT GEM
  # def self.text_search(query)
  #   if query.present?
  #     # where("title ilike :q or summary ilike :q", q: "%#{query}%")
  #     where("title @@ :q or summary @@ :q", q: "%#{query}%")
  #   else
  #     where(nil)
  #   end
  # end

  ########################

  # SEARCH ORIGINAL
  # def self.search(search)
  #   where("title LIKE ? OR body LIKE ? OR summary LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  # end

end
