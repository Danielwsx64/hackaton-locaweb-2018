RSpec.describe ServicesController do
  describe 'GET index' do
    it "assigns @services" do
      Service.create(
        title: 'some title',
        description: 'some description',
        duration: 4,
        price: 500
      )

      Service.create(
        title: 'other title',
        description: 'other description',
        duration: 5,
        price: 300
      )

      all_services = Service.all

      get :index
      expect(assigns(:services)).to eq(all_services)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end
