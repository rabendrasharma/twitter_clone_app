class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  has_many :tweeets
  has_many :comments
  has_many :followers, foreign_key: "followed_by"
  ## Database authenticatable
  field :email, type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token, type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count, type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at, type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip, type: String
  field :username, type: String
  field :name, type: String

  # def self.who_to_follow(current_user_id)
  #   where(["id != :current_user_id and not exists (
  #       select 1 from followers
  #       where user_id = users.id
  #       and followed_by = :current_user_id
  #     )", { current_user_id: current_user_id }])
  #     .order("random()").all
  # end

end