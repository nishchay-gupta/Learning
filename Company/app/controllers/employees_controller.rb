class EmployeesController < ApplicationController
  layout "employee"

  def new
    @employee = Employee.new
  end
  
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employees_path, notice: "Employee created successfully!"
    else
      flash.now[:alert] = @employee.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end
  
  def index
    @employees = Employee.all
  end

  def toggle_active
    employee = Employee.find(params[:id])
    employee.update(active: !employee.active)
    flash[:notice] = employee.active ? "Employee activated successfully!" : "Employee deactivated successfully!"
    redirect_to employees_path
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :gender, :address, :department_id, :accept_terms, :active)
  end
end
