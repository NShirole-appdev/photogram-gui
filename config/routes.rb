Rails.application.routes.draw do

 get("/users", { :controller => "users", :action => "index"})
 get("/users/:path_username", { :controller => "users", :action => "show"})
 get("/photos", { :controller => "photos", :action => "index"})
 get("/photos/:path_username", { :controller => "photos", :action => "show"})
end
