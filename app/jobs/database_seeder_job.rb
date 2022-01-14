class DatabaseSeederJob < ApplicationJob
  queue_as :default

  DEFAULT_USER_EMAIL = "user@example.com"
  DEFAULT_USER_PASSWORD = "password"

  def perform
    ActiveRecord::Base.transaction do
      create_default_user
      create_users
      create_posts
    end
  end

  private

  def create_default_user
    User.create!(
      email: DEFAULT_USER_EMAIL,
      password: DEFAULT_USER_PASSWORD,
      password_confirmation: DEFAULT_USER_PASSWORD,
    )
  end

  def create_users
    10.times do |i|
      User.create!(
        email: "user-#{i}@example.com",
        password: DEFAULT_USER_PASSWORD,
        password_confirmation: DEFAULT_USER_PASSWORD,
      )
    end
  end

  def create_posts
    User.all.each_with_index do |user, index|
      Post.create!(
        title: "Title for post #{index}",
        body: "Body for post #{index}",
        user: user
      )
    end
  end
end
