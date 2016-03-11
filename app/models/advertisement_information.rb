class AdvertisementInformation < ActiveRecord::Base
	belongs_to :information
	belongs_to :advertisement
	
	def self.get_advertisement_information advertisement, information
		if advertisement == nil || information == nil
			return nil
		end

		# ActiveRecord::Relation
		advertisement_information = AdvertisementInformation.where("advertisement_id = ? AND information_id = ?", 
																			advertisement.id, information.id)


		return advertisement_information.first
	end

	def self.get_informations_for_show
		
	end

end
