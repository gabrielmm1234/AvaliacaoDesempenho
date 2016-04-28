class InfosController < ApplicationController
	require 'json'

	def index
	end

	def create
		sql = "SELECT junior_enterprises.name as name,count(junior_enterprises.name) 
				as y from junior_enterprises,users 
				where users.junior_enterprise_id = junior_enterprises.id
				group by junior_enterprises.name"

		array = ActiveRecord::Base.connection.execute(sql)
		arrayint = array.map{|a| {name: a["name"], y: a["y"].to_i}}
		@json = []

		arrayint.each do |t|
  			@json << t
		end
		
		JSON.generate(@json)
	    render json: @json
	end

end