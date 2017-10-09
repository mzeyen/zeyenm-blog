class User < ApplicationRecord::Base
    has_many :comments
end
