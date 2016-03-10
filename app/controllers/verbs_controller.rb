class VerbsController < ApplicationController
  before_action :set_verb, only: [:show, :update, :destroy]
  before_action :validateToken


  # GET /verbs
  # GET /verbs.json
  def index
    @verbs = Verb.all

    render json: @verbs
  end

  # Get just 10 random verbs from DB
  def ten_random
    @verbs = Verb.order("RANDOM()").limit(10)
    render json: @verbs
  end

  def register_score
    @current_user
    params[:scores].each do |score|
      verb = Verb.find(score[:verbId])
      score = verb.scores.where(user: @current_user).first_or_create
      score.num_tries += 1
      score.num_correct += score[:isCorrect] ? 1 : 0
      score.efficiency_percentage = score.num_correct.to_f / score.num_tries.to_f
      score.save!
    end
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
