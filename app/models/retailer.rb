class Retailer < ActiveRecord::Base
	validates_presence_of :p_id, message:"不可為空白"
	validates_numericality_of :number_sold, :only_integer => true,message:'請輸入整數'
	validates_numericality_of :number_bought, :only_integer => true,message:'請輸入整數'

end
