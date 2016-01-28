class SentMessage < ActiveRecord::Base
belongs_to :message

validates :intro, presence: true
validates :body, presence: true
validates :end, presence: true

end