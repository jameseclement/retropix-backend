Rails.application.routes.draw do
  resources :users,  except: [:edit] do
    resources :documents do
      patch 'revert/:version_id', to: 'documents#revert'
      resources :versions, except: [:edit]
    end
  end
end
