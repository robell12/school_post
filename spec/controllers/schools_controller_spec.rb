require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do
  let(:school) { FactoryGirl.create(:school) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'sets school as instance variable' do
      get :index
      expect(assigns(:schools)).to eq([])
    end
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
    it 'has schools in the schools instance variable' do
      FactoryGirl.create_list(:school, 3)
      get :index
      expect(assigns(:schools).length).to eq(2)
      expect(assigns(:schools).last.name).to eq('name_2')
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: school.id
      expect(response).to have_http_status(:success)
    end
    it 'renders edit template' do
      get :edit, id: school.id
      expect(assigns(:school).id).to eq(school.id)
    end
    it 'sets school instance variable' do
      get :edit, id: school.id
      expect(assigns(:school).id).to eq(school.id)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
    it 'sets the new instance variable' do
      get :new
      expect(assigns(:school)).to_not eq(nil)
      expect(assigns(:school).id).to eq(nil)
    end
  end

  describe "POST #create" do
    before(:all) do
      @school_params = { school: FactoryGirl.attributes_for(:school) }
    end
    it 'sets the school instance variable' do
      post :create, @school_params
      expect(assigns(:school)).to_not eq(nil)
      expect(assigns(:school).name).to eq(@school_params[:school][:name])
    end
    it 'sets a new school' do
      expect(School.count).to eq(0)
      post :create, @school_params
      expect(School.count).to eq(1)
      expect(School.first.name).to eq(@school_params[:school][:name])
    end
  end

  describe 'DELETE #destroy' do
    it 'sets the school instance variable' do
      delete :destroy, id: school.id
      expect(assigns(:school)).to eq(school)
    end

    it 'destroys the school' do
      school
      expect(School.count).to eq(1)
      delete :destroy, id: school.id
      expect(School.count).to eq(0)
    end

    it 'sets the flash message' do
      delete :destroy, id: school.id
      expect(flash[:success]).to eq("School deleted")
    end

    it 'redirect to index path after destroy' do
      delete :destroy, id: school.id
      expect(response).to redirect_to(schools_path)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: school.id
      expect(response).to have_http_status(:success)
    end
    it "renders the show template" do
      get :show, id: school.id
      expect(response).to render_template(:show)
    end
    it "set the school instance variable" do
      get :show, id: school.id
      expect(assigns(:school).name).to eq(school.name)
    end
  end

  describe 'PUT #update' do
    it "sets the school instance variable" do
      put :update, { id: school.id, school: { name: 'new name' }}
      expect(assigns(:school).id).to eq(school.id)
    end
    it "updates the school" do
      put :update, { id: school.id, school: { name: 'new name'} }
      expect(school.reload.name).to eq ('new name')
    end
    it 'sets a flash message on success' do
      put :update, { id: school.id, school: { name: 'new name'} }
      expect(flash[:success]).to eq('School updated')
    end
    it 'redirects to show on success' do
      put :update, { id: school.id, school: { name: 'new name'} }
      expect(response).to redirect_to(school_path(school.id))
    end
    describe 'update failures' do
      # before(:each) do
      #   FactoryGirl.create(:school, name: nil)
      # end
      it 'renders exit on fail' do
        put :update, { id: school.id, school: { name: nil, rooms: '20' } }
        expect(response).to render_template(:edit)
      end
      it 'sets flash message on error' do
        put :update, { id: school.id, school: { name: nil, rooms: '20' } }
        expect(flash[:error]).to eq('No update')
      end
    end
  end
end
