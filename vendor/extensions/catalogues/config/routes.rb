Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :catalogues do
    resources :catalogues, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :catalogues, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :catalogues, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
