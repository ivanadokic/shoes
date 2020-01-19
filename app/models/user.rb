class User < ActiveRecord::Base
    has_many :shoes
    has_secure_password #using active record macro and to do validation
end


