require 'rails_helper'

RSpec.describe 'Category', type: :request do 

	fixtures :categories
	fixtures :options

	it "renders all category options in JSON format" do
		id = categories(:cars).id
		get "/categories/#{id}/options"

		expect(response.content_type).to eq("application/json")
		expect(response.status).to eq(200)
    expect(response).to have_http_status(:ok)

    category = Category.find(id)
    options = category.options
    expect(JSON.parse(response.body).size).to eq(options.count)
	end

end