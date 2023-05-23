require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'validations' do
    let(:doctor) { create(:doctor, phone_number: phone_number) }

    context 'with valid attributes' do
      let(:phone_number) { Faker::Number.number(digits: 10) }
      it 'is valid' do
        expect(doctor).to be_valid
      end
    end

    context 'with invalid attributes' do
      context 'when missing' do
        let(:phone_number) { nil }

        it 'is invalid without a first name' do
          expect { doctor }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

      context 'when less than 10 digits' do
        let(:phone_number) { Faker::Number.number(digits: 9) }

        it 'is invalid with a phone number less than 10 digits' do
          expect { doctor }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

      context 'when more than 15 digits' do
        let(:phone_number) { Faker::Number.number(digits: 16) }

        it 'is invalid with a phone number exceeding 15 digits' do
          expect { doctor }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

      context 'when non-numeric' do
        let(:phone_number) { Faker::Name.name }

        it 'is invalid with a non-numeric phone number' do
          expect { doctor }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

      context 'when duplicate' do
        let(:existing_doctor) { create(:doctor, phone_number: Faker::Number.number(digits: 10)) }
        let(:phone_number) { existing_doctor.phone_number }

        it 'is invalid with a duplicate phone number' do
          expect { doctor }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end
  end
end
