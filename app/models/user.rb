class User < ActiveRecord::Base
    attr_accessor :remember_token
    has_secure_password
    has_many :contact

    # Returns the hash digest of a given string
    def User.digest(string)
        cost = BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token
    def User.new_token
        SecureRandom.urlsafe_base64
    end

    # Store hashed remember token in database
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    # Compares remember token in cookies with hashed remember token in database
    def authenticated?(remember_token)
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    # Removes remember digest from database
    def forget
        update_attribute(:remember_digest, nil)
    end
end
