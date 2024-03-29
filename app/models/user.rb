class User < ActiveRecord::Base
  validates :name, presence: true

  # def self.search(name)
  #   where("name LIKE '%#{name}%'")
  # end

  scope :search, -> name { where("name LIKE '%#{name}%'") }
end