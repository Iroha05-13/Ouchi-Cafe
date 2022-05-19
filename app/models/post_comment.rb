class PostComment < ApplicationRecord

  belongs_to :users
  belongs_to :item

end
