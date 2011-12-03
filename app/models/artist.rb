class Artist < ActiveRecord::Base
  has_many :recordings
end
