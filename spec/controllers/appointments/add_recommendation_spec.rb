require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
  describe 'POST #attach_recommendation' do
    let(:doctor) { create(:doctor) }
    let(:user) { create(:user) }
    let(:appointment) { create(:appointment, user: user, doctor: doctor, start_time: 1.hour.from_now) }

    before do
      sign_in(doctor)
    end

    context 'with valid recommendation' do
      let(:recommendation_params) { { recommendation: Faker::Lorem.sentence } }

      it 'adds a recommendation for the appointment' do
        post :attach_recommendation, params: { id: appointment.id, appointment: recommendation_params }

        appointment.reload
        expect(appointment.recommendation).to eq(recommendation_params[:recommendation])
        expect(appointment).to be_closed
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('Your recommendation has been added.')
      end
    end

    context 'with invalid recommendation' do
      let(:recommendation_params) { { recommendation: nil } }

      it 'does not add a recommendation for the appointment' do
        post :attach_recommendation, params: { id: appointment.id, appointment: recommendation_params }

        appointment.reload
        expect(appointment.recommendation).to be_blank
        expect(appointment).not_to be_closed
        expect(response).to redirect_to(add_recommendation_appointment_path(appointment))
        expect(flash[:alert]).to eq("Recommendation can't be blank")
      end
    end
  end
end
