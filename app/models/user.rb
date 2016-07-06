class User < ActiveRecord::Base
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  #Regex for the email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #Validaciones para que el correo ingresado sea correcto
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  #Metodo para el password
  has_secure_password
  #Validaciones para password
  validates :password, presence: true, length: { minimum: 6 }

end