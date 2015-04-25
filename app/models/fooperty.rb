class Fooperty < ActiveRecord::Base
  has_many :foonits, dependent: :destroy, autosave: true

end
