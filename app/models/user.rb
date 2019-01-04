class User < ApplicationRecord

    has_many :user_questions, dependent: :destroy
    has_many :questions, through: :user_questions, dependent: :destroy
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_secure_password
    
    validates :name, :email, :password_digest, presence: true
    validates :name, :length => {in: 2..30}
    # validates :password_digest, :length => {minimum: 6}
    validates :email, uniqueness: true
    validates :email, format: {
        with: URI::MailTo::EMAIL_REGEXP
      }

    def name_email
        "#{self.name}: #{self.email}"
    end
    
end
