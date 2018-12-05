class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  belongs_to :tweeet
  belongs_to :user
  field :body, type: String, default: ""
end