module LoginUser
  def login_user
    Warden.test_mode!
    user = User.create(
                        email: nil,
                        sign_in_count: 1
                      )
    login_as user
    user.confirmed_at = Time.now
    user.confirm!
    user.save
    user
  end
end