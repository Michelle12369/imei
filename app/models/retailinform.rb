class Retailinform < ActiveRecord::Base
validates_presence_of :p_id, message:'不可為空白'
	validates_uniqueness_of :p_id, message: '產品編號已存在，請至相同編號的資料編輯'
	validates_numericality_of :max_demand,:min_demand,:book_cost,:hold_cost,:cost,:price, :only_integer => true,message:'請輸入整數'
end

