describe "services/index.html.erb" do
  it "displays all the servcies" do
    service_one = Service.create(
      title: 'some title',
      description: 'some description',
      duration: 4,
      price: 500
    )

    service_two = Service.create(
      title: 'other title',
      description: 'other description',
      duration: 5,
      price: 300
    )
    assign(:services, [service_one, service_two])

    render

    expect(rendered).to include("some title")
    expect(rendered).to include("other title")
  end
end
