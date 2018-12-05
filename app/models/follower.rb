class Follower
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :user_id, type: String
  field :followed_by, type: String
  belongs_to  :user, foreign_key: "followed_by"
end