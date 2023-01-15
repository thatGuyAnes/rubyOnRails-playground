class User < ApplicationRecord

  before_save { self.email = email.downcase }

  has_many :articles

  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i},
            length: { maximum: 105 }

  has_secure_password
end
