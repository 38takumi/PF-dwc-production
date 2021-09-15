class Event < ApplicationRecord
  belongs_to :customer

  # 検索機能　ここから
 def self.search(search, word)
  if search == "forward_match"
   @event = Event.where("event_title LIKE?","#{word}%")
  elsif search == "backward_match"
    @event = Event.where("event_title LIKE?","%#{word}")
  elsif search == "perfect_match"
    @event = Event.where("#{word}")
  elsif search == "partial_match"
    @event = Event.where("event_title LIKE?","%#{word}%")
  else
    @event = Event.all
  end
 end
 # 検索機能　ここまで
end
