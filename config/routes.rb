Rails.application.routes.draw do
  #resources
  resources "places"
  resources "posts"
  resources "sessions"
  resources "users"

  #login/out + root route
  get "/", :controller => "places", :action => "index"
  get "/login", :controller => "sessions", :action => "new"
  get "/logout", :controller => "sessions", :action => "destroy"
end