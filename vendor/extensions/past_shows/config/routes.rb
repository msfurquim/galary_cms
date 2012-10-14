Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :past_shows do
    resources :past_shows, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :past_shows, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :past_shows, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
