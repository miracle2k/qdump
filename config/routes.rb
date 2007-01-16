ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.
  
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Hook up website root 
  map.connect "", :controller => "page"
  
  # All our pages are in "page", but if no action follows, than we will think of
  # it as an accessor.
  map.connect "page", :controller => "page", :action => "view", :id => "page"

  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  map.connect ':controller/service.wsdl', :action => 'wsdl'
    
  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id'
  
  # This needs to be placed after the default route, or Rails seems unable to build
  # correct urls using 'link_to'
  map.connect ":id", :requirements => { :id => /^[a-zA-Z0-9]+$/ }, :controller => "page", :action => "view"
end
