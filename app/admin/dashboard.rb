# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      column do
        panel "Recent Appointments" do
          ul do
            Appointment.last(5).map do |app|
              ul do
                li app.id
                li app.user.full_name
                li app.doctor.full_name_with_category
                li app.start_time
                li app.status
              end
            end
          end
        end
      end

      column do
        panel "Categories" do
          ul do
            Category.all.map do |category|
              ul do
                li "#{category.public_label} (#{category.doctors.count})"
              end
            end
          end
        end
      end
    end
  end
end
