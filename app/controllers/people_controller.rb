class PeopleController < ApplicationController
  before_action :authenticate_user!
  before_action :set_person, only: %i[ show edit update destroy ]
  before_action :correct_user, only: %i[ index show edit update destroy ]

  # GET /people or /people.json
  def index
    @people = Person.all
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = current_user.person.build
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people or /people.json
  def create
    @person = current_user.person.build(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to person_url(@person), notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to person_url(@person), notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    def correct_user
      @person = current_user.person.find_by(id: params[:id])
      # redirect_to edit_user_registration_path, notice: "Not an Authorised User" if @person.nil?
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:name, :ph_no, :user_id)
    end
end
