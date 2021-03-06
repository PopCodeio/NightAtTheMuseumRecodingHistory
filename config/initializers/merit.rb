# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  config.current_user_method = 'current_user'
end

# Create application badges (uses https://github.com/norman/ambry)
badge_id = 0
[{
  id: (badge_id = badge_id+1),
  name: 'just-registered',
  description: 'Just registered!'
}, {
  id: (badge_id = badge_id+1),
  name: 'autobiographer',
  description: 'Completed "About Me" section of user profile'
}, {
  id: (badge_id = badge_id+1),
  name: 'commentator',
  description: 'Left 10 comments'
}, {
  id: (badge_id = badge_id+1),
  name: 'pundit',
  description: 'Left 10 comments with score of 5 or more'
}, {
  id: (badge_id = badge_id+1),
  name: 'historian',
  description: ''
}, {
  id: (badge_id = badge_id+1),
  name: 'explorer',
  description: ''
}, {
  id: (badge_id = badge_id+1),
  name: 'curator',
  description: ''
}, {
  id: (badge_id = badge_id+1),
  name: 'chief_curator',
  description: ''
},
{
  id: (badge_id = badge_id+1),
  name: 'archaeologist',
  description: ''
}].each do |attrs|
  Merit::Badge.create! attrs
end
