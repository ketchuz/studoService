class VerbsController < ApplicationController
  before_action :set_verb, only: [:show, :update, :destroy]
  before_action :validateToken


  # GET /verbs
  # GET /verbs.json
  def index
    @verbs = Verb.all

    render json: @verbs
  end

  # GET /verbs/1
  # GET /verbs/1.json
  def show
    render json: @verb
  end

  # POST /verbs
  # POST /verbs.json
  def create
    @verb = Verb.new(verb_params)

    if @verb.save
      render json: @verb, status: :created, location: @verb
    else
      render json: @verb.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /verbs/1
  # PATCH/PUT /verbs/1.json
  def update
    @verb = Verb.find(params[:id])

    if @verb.update(verb_params)
      head :no_content
    else
      render json: @verb.errors, status: :unprocessable_entity
    end
  end

  # DELETE /verbs/1
  # DELETE /verbs/1.json
  def destroy
    @verb.destroy

    head :no_content
  end

  private

    def set_verb
      @verb = Verb.find(params[:id])
    end

    def verb_params
      params.require(:verb).permit(:german, :english, :spanish, :type, :past, :future, :past_verb_helper)
    end
end
