class Api::AuthorsController < ApplicationController

    def index
      @users = Author.all
    end
    
end