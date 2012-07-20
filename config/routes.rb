TestApp::Application.routes.draw do

# this provides the parsing of /posts/ routes in rails application for the requestsing coming from the web.

  # it will provide us with the following automated routes
  # using four types of HTTP Verbs:  GET, POST, PUT and DELETE
  #  /posts         GET-request   -   index action                              -   posts_path
  #  /posts/new     GET-request   -   new action                                -   new_post_path
  #  /posts         POST-request  -   create action                             -   posts_path
  #  /posts/9       GET-request   -   show action with a parameter id=9         -   post_path(id)
  #  /posts/9/edit  GET-request   -   edit action with a parameter id=9         -   edit_post_path(id)
  #  /posts/9       PUT-request   -   update action with a parameter id=9       -   post_path(id) # :method => :put
  #  /posts/9       DELETE-request  - destroy action with a parameter id=9    -   post_path(id) # :method => :delete


   resources :posts do
   
   # post_comments_path(post)
   # post_comment_path(post, comment)
   # edit_post_comment_path(post, comment)
   # new_post_comment_path(post)

   resources :comments #this will created the nested resources for the comments
   end
   
   resources :categories
end
