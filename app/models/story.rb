class Story < ActiveRecord::Base
 has_many :snippets, dependent: :destroy
end
