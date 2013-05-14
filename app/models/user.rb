class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  # Confirmable
  field :confirmation_token,   :type => String
  field :confirmed_at,         :type => Time
  field :confirmation_sent_at, :type => Time
  field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  # Token authenticatable
  field :authentication_token, :type => String

  # Additional fields
  field :username, :type => String
  field :fullname, :type => String
  field :birthday, :type => Date
  field :location, :type => String
  field :bio,      :type => String
  field :locale,   :type => String

  # todo Avatar fields

  GENDER = { male: 0, female: 1, secret: 2 }
  field :gender,   :type => Integer, :default => GENDER['secret']
  field :guest,    :type => Boolean, :default => false

  has_many :events,     dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :tags,       dependent: :destroy

  validates_presence_of :username

end
