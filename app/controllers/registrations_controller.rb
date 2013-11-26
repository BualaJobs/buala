class RegistrationsController < Devise::RegistrationsController

  layout 'profile_layout', only: [:edit, :update]

end