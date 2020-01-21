class Client < ActiveRecord::Base
  has_many :projects
  has_many :costs, through: :projects
end
