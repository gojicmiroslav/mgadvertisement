ActiveAdmin.register Advertisement do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

permit_params :status

  form do |f|
    f.inputs do
      f.semantic_errors

      f.input :title
      f.input :description
      f.input :price
      f.input :year
      f.input :category, include_blank: false
      f.input :vehicle_model, include_blank: false
      f.input :user
      f.input :advertisement_type, include_blank: false
      f.input :slug
      f.input :status, as: :select, collection: Advertisement.statuses.keys, include_blank: false
    end

    f.actions
  end

  after_update do |advertisement|
    UserMailer.advertisement_updated(advertisement.user.email, advertisement).deliver_now
  end

end
