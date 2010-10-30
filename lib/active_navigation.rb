require 'active_support'

require 'active_navigation/helpers'
require 'active_navigation/nav_menu_class'

ActionView::Base.send :include, ActiveNavigation::Helpers

