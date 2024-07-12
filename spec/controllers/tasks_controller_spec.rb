require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:user) { create(:user) }
  let(:task) { create(:task, user: user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns all tasks to @tasks' do
      task
      get :index
      expect(assigns(:tasks)).to eq([task])
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: task.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Task' do
        expect {
          post :create, params: { task: { name: 'New Task', due_date: Date.tomorrow, completed: false } }
        }.to change(Task, :count).by(1)
      end

      it 'redirects to the tasks list' do
        post :create, params: { task: { name: 'New Task', due_date: Date.tomorrow, completed: false } }
        expect(response).to redirect_to(tasks_path)
      end
    end

    context 'with invalid params' do
      it 'renders the new template' do
        post :create, params: { task: { name: '', due_date: '', completed: false } }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: task.id }
      expect(response).to be_successful
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested task' do
        put :update, params: { id: task.id, task: { name: 'Updated Task' } }
        task.reload
        expect(task.name).to eq('Updated Task')
      end

      it 'redirects to the tasks list' do
        put :update, params: { id: task.id, task: { name: 'Updated Task' } }
        expect(response).to redirect_to(tasks_path)
      end
    end

    context 'with invalid params' do
      it 'renders the edit template' do
        put :update, params: { id: task.id, task: { name: '' } }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested task' do
      task
      expect {
        delete :destroy, params: { id: task.id }
      }.to change(Task, :count).by(-1)
    end

    it 'redirects to the tasks list' do
      delete :destroy, params: { id: task.id }
      expect(response).to redirect_to(tasks_path)
    end
  end

  describe 'PATCH #complete' do
    it 'marks the task as complete' do
      patch :complete, params: { id: task.id }
      task.reload
      expect(task.completed).to be_truthy
    end

    it 'redirects to the tasks list' do
      patch :complete, params: { id: task.id }
      expect(response).to redirect_to(tasks_path)
    end
  end
end
