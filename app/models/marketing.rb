class Marketing < ActiveRecord::Base
	validates_uniqueness_of :p_id,:scope=>:valid_date
	validates_uniqueness_of :p_id,:scope=>:r_inventory
end
