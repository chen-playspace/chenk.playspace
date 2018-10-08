class User < ApplicationRecord
  has_secure_password                                           #CK Note: 'has_secure_password' is a feature for authentication support to the user model using a 'password_digest' column

  # attr_accessible :email, :password, :password_confirmation     #CK Note: This will specify the attribute/field user can set to the sign up form (double confirm if this is required???)

  validates_uniqueness_of :email                                #CK Note: This will add validation to the user model (ie. validate uniqueness of email). We can also validate other identifier if we want (eg. format of the email, length of password and etc). We don't need to validate the presence of the password or the password confirmation because that is automatically gonna be handled by 'has_secure_password' feature.
end
