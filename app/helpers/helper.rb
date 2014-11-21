helpers do

  def gravatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    # image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def pony(user_email)
    Pony.mail({
  :to => user_email,
  :subject => "Welcome!",
  :body => "Welcome to Twittastrophe!!!",
  :via => :smtp,
  :via_options => {
    :address              => 'smtp.gmail.com',
    :port                 => '587',
    :enable_starttls_auto => true,
    :user_name            => 'twittertest109@gmail.com',
    :password             => 'ilovecakes123',
    :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
    :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
  }
})
  end
end
