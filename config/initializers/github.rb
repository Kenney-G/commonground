Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, ENV['8d3f4a4ee194e489b7c0'], ENV['5d0a0fe8367aefe9e51f39cd032bfaa0913974db']
  end