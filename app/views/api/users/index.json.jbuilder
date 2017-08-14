@users.each do |user|
  json.set! user.id do
    json.extract! user, :id, :email, :tag, :is_guest?, :phone_number
  end
end
