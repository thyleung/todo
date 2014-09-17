require 'spec_helper'

describe "Deleting todo lists" do

	let!(:todo_list) { TodoList.create(title: "Groceries", description: "Grocery list") }

	def delete_todo_list(options={})		
		todo_list = options[:todo_list]
		
		visit "/todo_lists"

		within "#todo_list_#{todo_list.id}" do
			click_link "Destroy"
		end
	end

	it "deletes a todo list successfully" do
		delete_todo_list todo_list: todo_list

		expect(page).to_not have_content("Groceries")
		expect(TodoList.count).to eq(0)
	end
end