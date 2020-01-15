class User < ActiveRecord::Base
    has_many :shoes
    has_secure_password
end


