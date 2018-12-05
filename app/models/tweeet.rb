class Tweeet
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :tweeet, type: String, default: ""
  # field :user_id, type: Integer
  belongs_to :user
  has_many :comments
end