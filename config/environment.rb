require 'bundler'
Bundler.require
require 'csv'


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
require_all 'app'
require_all 'db'

ActiveRecord::Base.logger = Logger.new(STDOUT)
