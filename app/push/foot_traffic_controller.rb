class FootTrafficController < FayeRails::Controller
  # on user create event, publish new whereabout
  observe User, :after_create do |user|
    FootTrafficController.publish('/traffic', { user => user.attributes })
  end

  # on whereabout create event, publish new whereabout
  observe Whereabout, :after_create do |whereabout|
    FootTrafficController.publish('/traffic', { whereabout => whereabout.attributes })
  end
end
