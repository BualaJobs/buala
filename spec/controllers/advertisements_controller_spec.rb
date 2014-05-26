require 'spec_helper'

describe AdvertisementsController do

  let (:advertisement) { create(:advertisement) }
  let (:inexistent_advertisement_id) { advertisement.id + 1}
  let (:user) { create(:user) }

  context 'when advertisement does not exists' do

    describe '#show' do
      before { get :show, id: inexistent_advertisement_id }
      it { should respond_with 404 }
    end

    describe '#apply' do
      before { post :apply, id: inexistent_advertisement_id }
      it { should respond_with 404 }
    end

  end

  context 'when advertisement exists' do

    describe '#show' do
      
      it 'should be redirected if it is not a slugged url' do
        get :show, id: advertisement.id
        should redirect_to advertisement_path(advertisement)
      end

      it 'should respond successfully if it is a slugged url' do
        get :show, id: advertisement.slug
        should respond_with 200
      end

    end

    context 'and user is not singed in' do

      describe '#apply' do
        before { post :apply, id: advertisement.slug }
        it { should redirect_to new_user_session_path }
      end

    end

    context 'and user is signed in' do

      before { sign_in :user, user }

      context 'and has never applied' do

        describe '#apply' do
          before { post :apply, id: advertisement.slug}
          it { should respond_with 201 }
        end

      end

      context 'and has already applied' do
        before do
          2.times do
            post :apply, id: advertisement.slug
          end
        end

        it { should respond_with 400 }
      end

    end

  end

end
