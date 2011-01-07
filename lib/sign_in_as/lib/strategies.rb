require 'devise/strategies/base'

module SignInAs
	module Devise
		module Strategies
			class FromAdmin < ::Devise::Strategies::Base
				include SignInAs::Concerns::RememberAdmin
				
				def valid?
					remember_admin_id?
				end
				
				def authenticate!
					resource = User.find(remember_admin_id)
					if resource
						clear_remember_admin_id
						success!(resource)
					else
						pass
					end
				end
			end
		end
	end
end