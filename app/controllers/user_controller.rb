require_relative '../views/base_view.rb'

class  UserController
  def initialize(user_repository)
    @user_repository = user_repository
    @view = BaseView.new
  end

  # -> list all the available users
  def list
    # ask the user_repository for a list of all the users
    users = @user_repository.all
    # pass that list to the view to display
    @view.list_users(users)
  end

  # -> add a new user
  def add
    # ask the user for the user name
    new_user_name = @view.ask_user_for(:username)
    # ask the user for the user continent
    new_user_continent = @view.ask_user_for(:password)
    # create an instance of `Country` based on what the user said
    new_user = User.new(username: new_user_name, password: new_user_continent)
    # adding in to the user_repository
    @user_repository.add(new_user)
  end

  def sign_in
    # 1. Ask user for username
    username = @view.ask_user_for("username")
    # 2. Ask user for password
    password = @view.ask_user_for("password")
    # 3. Find the user with the username
    user = @user_repository.find_by_username(username)
    # 4. Compare the password given with the one in DB.
    if user && user.password == password
      @view.signed_in_successfully(user)
      return user
    else
      @view.wrong_credentials
      sign_in # Recursive call
    end
  end
end














