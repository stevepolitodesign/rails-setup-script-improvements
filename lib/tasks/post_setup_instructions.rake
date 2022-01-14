namespace :post_setup_instructions do
  desc "Prints instructions once setup is complete."
  task perform: :environment do
    PostSetupInstructionsJob.perform_now
  end

end
