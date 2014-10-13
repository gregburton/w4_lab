class User < ActiveRecord::Base
  has_secure_password
  has_many :lists
  has_many :tasks


  validates :email, presence: true,
                    uniqueness: true

  before_save :downcase_email

  def downcase_email
    self.email = email.downcase
  end
end
