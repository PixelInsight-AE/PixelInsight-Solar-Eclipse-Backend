json.user do
  json.extract! @user, :id, :username, :email, :birthdate
end
