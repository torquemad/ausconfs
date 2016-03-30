class User < ActiveRecord::Base
  has_many :conferences
end
