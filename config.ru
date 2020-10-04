require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride 
# In order to use this middleware, and therefore us
# PATCH, PUT, and DELETE requests, we must tell our app to use the middleware
# above run ApplicationController
use ShoesController
use UsersController
run ApplicationController
