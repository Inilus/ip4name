class TokensController < ApplicationController


  def create
    @token_length = 3
    @token_length = 200 if params["type"] == "hugy"
    @token = generate_token
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  private

    def generate_token
      if (temp_token = random_token) and current_user.links.find_by_token(temp_token).nil?
        @token = temp_token
      else
        generate_token
      end
    end

    def random_token
      characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890'
      temp_token = ''
      srand
      @token_length.times do
        pos = rand( characters.length )
        temp_token += characters[pos..pos]
      end
      temp_token
    end

end

