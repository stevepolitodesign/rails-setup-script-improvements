class PostSetupInstructionsJob < ApplicationJob
  queue_as :default

  def perform
    puts "\n== Setup complete! š  =="
    puts "\nš  Run \"rails s\" to start the development server."
    puts "\n== You can login with the following account  =="
    puts "\nš  #{Rails.application.routes.url_helpers.new_user_session_url(host: "localhost", port: 3000)}"
    puts "\š§  Email: #{DatabaseSeederJob::DEFAULT_USER_EMAIL}"
    puts "\š  Password: #{DatabaseSeederJob::DEFAULT_USER_PASSWORD}"
    puts "\n"
  end

end
