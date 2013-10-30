class Story < ActiveRecord::Base
 has_many :snippets, dependent: :destroy
 acts_as_taggable_on :tags
end
