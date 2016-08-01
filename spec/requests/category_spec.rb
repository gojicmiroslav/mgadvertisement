 require 'rails_helper'

RSpec.describe 'Category', type: :request do 

  fixtures :information_types 
  fixtures :information
	fixtures :categories
	fixtures :options

	it "renders all basic informations for given category in JSON format" do
		# CARS
		get basic_category_path(categories(:cars).id)
		expect(response.content_type).to eq("application/json")
		expect(response.status).to eq(200)
    expect(response).to have_http_status(:ok)
    # 3 - from fixtures
    expect(JSON.parse(response.body).size).to eq(3)

		# BYCICLES
		get basic_category_path(categories(:bicycles).id)
		expect(response.content_type).to eq("application/json")
		expect(response.status).to eq(200)
    expect(response).to have_http_status(:ok)
    # 1 - from fixtures
    expect(JSON.parse(response.body).size).to eq(1) 

    # TRUCKS
		get basic_category_path(categories(:trucks).id)
		expect(response.content_type).to eq("application/json")
		expect(response.status).to eq(200)
    expect(response).to have_http_status(:ok)
    # 3 - from fixtures
    expect(JSON.parse(response.body).size).to eq(3)    
	end

	it "renders all additional informations for given category in JSON format" do
		# CARS
		get additional_category_path(categories(:cars).id)
		expect(response.content_type).to eq("application/json")
		expect(response.status).to eq(200)
    expect(response).to have_http_status(:ok)
    # 8 - from fixtures
    expect(JSON.parse(response.body).size).to eq(8)

    # BYCICLES
		get additional_category_path(categories(:bicycles).id)
		expect(response.content_type).to eq("application/json")
		expect(response.status).to eq(200)
    expect(response).to have_http_status(:ok)
    # 4 - from fixtures
    expect(JSON.parse(response.body).size).to eq(4)

    # TRUCKS
		get additional_category_path(categories(:trucks).id)
		expect(response.content_type).to eq("application/json")
		expect(response.status).to eq(200)
    expect(response).to have_http_status(:ok)
    # 9 - from fixtures
    expect(JSON.parse(response.body).size).to eq(9)
	end

end