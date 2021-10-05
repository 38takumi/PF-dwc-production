class Tag < ApplicationRecord
  belongs_to :customer

  # 検索機能　ここから
  def self.search(search, word)
    if search == "forward_match"
      @tag = Tag.where("tag_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @tag = Tag.where("tag_name LIKE?","%#{word}")
    elsif search == "perfect_match"
      @tag = Tag.where(tag_name: word)
    elsif search == "partial_match"
      @tag = Tag.where("tag_name LIKE?","%#{word}%")
    else
      @tag = Tag.all
    end
  end
  # 検索機能　ここまで
end
