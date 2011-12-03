class Recording < ActiveRecord::Base
  belongs_to :artist
  delegate :name, :to => :artist, :prefix => true, :allow_nil => true
end
