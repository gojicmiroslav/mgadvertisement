require 'rails_helper'

RSpec.describe 'Information', type: :request do 

	fixtures :information_types
	fixtures :information
	fixtures :items

	it "renders all items for given information in JSON format" do
		# CAPACITY
		get items_information_path(information(:capacity).id)
		expect(response.content_type).to eq("application/json")
		expect(response.status).to eq(200)
    expect(response).to have_http_status(:ok)
    information = Information.find_by(name: "Capacity(cm3)")
    items = information.items
    expect(JSON.parse(response.body).size).to eq(items.count)
    # 0 - count from fixtures
    expect(JSON.parse(response.body).size).to eq(0)

    # POWER
		get items_information_path(information(:power).id)
		expect(response.content_type).to eq("application/json")
		expect(response.status).to eq(200)
    expect(response).to have_http_status(:ok)
    information = Information.find_by(name: "Power")
    items = information.items
    expect(JSON.parse(response.body).size).to eq(items.count)
    # 0 - count from fixtures
    expect(JSON.parse(response.body).size).to eq(0)

    # MILEAGE
		get items_information_path(information(:mileage).id)
		expect(response.content_type).to eq("application/json")
		expect(response.status).to eq(200)
    expect(response).to have_http_status(:ok)
    information = Information.find_by(name: "Mileage")
    items = information.items
    expect(JSON.parse(response.body).size).to eq(items.count)
    # 0 - count from fixtures
    expect(JSON.parse(response.body).size).to eq(0)

    # TYPE
		get items_information_path(information(:type).id)
		expect(response.content_type).to eq("application/json")
		expect(response.status).to eq(200)
    expect(response).to have_http_status(:ok)
    information = Information.find_by(name: "Type")
    items = information.items
    expect(JSON.parse(response.body).size).to eq(items.count)
    # 6 - count from fixtures
    expect(JSON.parse(response.body).size).to eq(6)

    # FUEL
    get items_information_path(information(:fuel).id)
		expect(response.content_type).to eq("application/json")
		expect(response.status).to eq(200)
    expect(response).to have_http_status(:ok)
    information = Information.find_by(name: "Fuel")
    items = information.items
    expect(JSON.parse(response.body).size).to eq(items.count)
    # 5 - count from fixtures
    expect(JSON.parse(response.body).size).to eq(5)

	end

end