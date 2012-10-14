Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :current_shows do
    resources :current_shows, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :current_shows, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :current_shows, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
