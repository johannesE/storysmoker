class Snippet < ActiveRecord::Base
  belongs_to :story
  validates :content, presence: true

end

