class SubOwnersController < ApplicationController
	def list_for_add_owner
		@users = User.find_each
	end

	def add_owner
	end

	def delete_owner
	end

end
