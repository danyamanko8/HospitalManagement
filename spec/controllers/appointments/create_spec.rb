require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:doctor) { create(:doctor) }
    let(:params) { { doctor_id: doctor.id } }
    let(:record_params) { { doctor_id: doctor.id, user_id: user.id, start_time: 1.hour.from_now } }

    before do
      sign_in(user)
    end

    context 'with valid attributes' do
      it 'creates a new appointment' do
        expect {
          post :create, params: { appointment: record_params }
        }.to change(Appointment, :count).by(1)

        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('Your appointment has been created.')
      end
    end

    context 'with invalid attributes' do
      let(:record_params) { { doctor_id: doctor.id, user_id: user.id, start_time: nil } }

      it 'does not create a new appointment' do
        expect {
          post :create, params: { appointment: record_params }
        }.not_to change(Appointment, :count)

        expect(response).to redirect_to(new_appointment_path(doctor_id: doctor.id))
        expect(flash[:alert]).to eq("Start time can't be blank; Start time is not included in the list")
      end
    end
  end
end

