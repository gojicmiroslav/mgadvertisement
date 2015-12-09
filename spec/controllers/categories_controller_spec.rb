require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do 

	let(:category){ FactoryGirl.create(:category) }
	let(:category_2){ FactoryGirl.create(:category_2) }
	let(:category_3){ FactoryGirl.create(:category_3) }
	let(:category_4){ FactoryGirl.create(:category_4) }
	let(:categories){ Category.all }

	describe "Get INDEX" do
		it "has a 200 status code" do
			get :index
			expect(response.status).to eq(200)
		end

		it "assigns all categories to @categories" do
			get :index
			expect(assigns(:categories)).to eq(categories)
		end

		it "render INDEX template" do
			get :index
			expect(response).to render_template(:index)
		end

	end

	describe "Get SHOW" do
		
		it "has a 200 status code" do
			get :show, id: category.id
			expect(response.status).to eq(200)
		end

		it "shows category with category.id" do
			get :show, id: category.id
			expect(assigns(:category)).to eq(category)
		end

		it "render SHOW template" do
			get :show, id: category.id
			expect(response).to render_template(:show)
		end

	end

	describe "Get NEW" do
		
		it "has a 200 status code" do
			get :new 
			expect(response.status).to eq(200)	
		end

		it "assigns new category to @category" do
			get :new
			expect(assigns(:category)).to be_a_new(Category)
		end

		it "render NEW template" do
			get :new
			expect(response).to render_template(:new)
		end

	end

	describe "Post CREATE" do

		it "has a 200 status code" do
			post :create, category: { name: category.name, description: category.description } 
			expect(response.content_type).to eq "text/html"	
		end
		
		context "Valid Category" do
			
			it "shold create a new category" do
				expect do
					post :create, category: { name: "Category", description: "Description" }
				end.to change(Category, :count).by(1)

				expect(flash[:success]).to be_present
				expect(flash[:alert]).not_to be_present
				expect(response).not_to render_template 'new'
			end
		end

		context "Invalid Category" do
			
			it "shold not create a new category" do
				expect do
					post :create, category: { name: "", description: "" }
				end.to change(Category, :count).by(0)

				expect(flash[:success]).not_to be_present
				expect(flash[:alert]).to be_present
				expect(response).to render_template 'new'
			end
		end
	end

	describe "Get EDIT" do
		
		it "has a 200 status code" do
			get :edit, id: category.id 
			expect(response.status).to eq(200)	
		end

		it "assigns category to @category" do
			get :edit, id: category.id
			expect(assigns(:category)).to eq(category)
		end

		it "render NEW template" do
			get :edit, id: category.id
			expect(response).to render_template(:edit)
		end
	end

	describe "Put UPDATE" do
		
		it "has a 200 status code" do
			put :update, id: category.id, category: { name: "Updated Category", description: category.description } 
			expect(response.content_type).to eq "text/html"	
		end

		context "Valid Category" do
			
			it "should update a category" do
				name = "Updated Category"
				description = "Updated Description"
				put :update, id: category.id, category: { name: name, description: description }
				category.reload

				expect(category.name).to eq(name)
				expect(category.description).to eq(description)

				expect(flash[:success]).to be_present
				expect(flash[:alert]).not_to be_present
				expect(response).not_to render_template 'edit'
			end
		end

		context "Invalid Category" do

			it "should not update a category" do
				name = ""
				description = "Updated Description"
				put :update, id: category.id, category: { name: name, description: description }
				category.reload				

				expect(category.name).not_to eq(name)
				expect(category.description).not_to eq(description)

				expect(flash[:success]).not_to be_present
				expect(flash[:alert]).to be_present
				expect(response).to render_template 'edit'
			end
		end
	end

	describe "Delete DESTROY" do

		it "should destroy a category" do
			expect(Category.find_by(id: category.id)).not_to be_nil
			expect do
				delete :destroy, id: category.id
			end.to change(Category, :count).by(-1)
				
			expect(Category.find_by(id: category.id)).to be_nil
			expect(assigns(:category)).to eq(category)
		end
	end
	
end