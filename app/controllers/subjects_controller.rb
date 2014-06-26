class SubjectsController < ApplicationController

  layout "admin"

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to action: :index
      flash[:notice] = "Subject created successfully."
    else
      render :new
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])

    if @subject.update_attributes(subject_params)
      redirect_to action: :show, id: @subject.id
      flash[:notice] = "Subject updated successfully."
    else
      render :edit
    end

  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject #{subject.name}  destroyed successfully."
    redirect_to action: :index
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

end
