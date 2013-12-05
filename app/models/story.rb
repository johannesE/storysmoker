class Story < ActiveRecord::Base

 has_many :snippets

 validates :title, presence: true
 validates :tag_list, presence: true




 has_many :snippets, dependent: :destroy
 acts_as_taggable_on :tags

end
