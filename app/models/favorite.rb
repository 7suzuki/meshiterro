class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :post_image
  
  # バリデーション、同じ人が何度もいいねを押せない＝useridとpostimageidのペアが重複しない
  validates :user_id, uniqueness: {scop: :post_image_id}
end
