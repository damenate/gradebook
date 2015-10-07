class Parent < ActiveRecord::Base
  has_secure_password
  has_on :student
end
