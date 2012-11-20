Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :biographies do
    resources :biographies, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :biographies, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :biographies, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
