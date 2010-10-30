# Include hook code here
require 'active_navigation'
ActiveRecord::Base.send :include, ActiveNavigation::Helpers::ClassMethods
ActionView::Base.send :include, ActiveNavigation::Helpers::ClassMethods

