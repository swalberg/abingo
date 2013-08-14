require 'rubygems'
require 'rails'

require 'rails/all'
require 'test/unit'

require 'abingo'
  #We need to load the whole Rails application to properly initialize Rails.cache and other constants.  Oh boy.
require ::File.expand_path('../../rails4test/config/environment',  __FILE__)

