class RegistrationsController < Devise::RegistrationsController
  
  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.is_a?(User) && resource.can_publish?
        publisher_url
      else
        super
      end
  end

  def create
    super do |resource|
      if resource.persisted?
        sign_up(resource_name, resource)
        return redirect_to new_profile_path
      end
    end
  end
end