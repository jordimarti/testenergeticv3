class HabitsController < ApplicationController
  before_action :set_habit, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def index
    @habits = Habit.all
  end

  def show
  end

  def new
    @habit = Habit.new
  end

  def edit
  end

  def create
    @habit = Habit.new(habit_params)
    @habit.save
    @habits = Habit.where(entitat_id: @habit.entitat_id)
  end

  def update
    @habit.update(habit_params)
    @habits = Habit.where(entitat_id: @habit.entitat_id)
  end

  def destroy
    @habits = Habit.where(entitat_id: @habit.entitat_id)
    @habit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_habit
      @habit = Habit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def habit_params
      params.require(:habit).permit(:entitat_id, :ambit, :nom, :descripcio)
    end
end
