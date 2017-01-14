class Post < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 } # capacidade de caracteres do twwet
  default_scope -> { order(created_at: :desc) } # Novos twwets / primeiros posts
end
