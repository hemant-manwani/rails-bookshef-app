class AdminSessionsController < ApplicationController
  def new
    @admin_session = AdminSession.new
  end

  def create
    @admin_session = AdminSession.create(admin_session_params)
    if @admin_session.save
      flash[:notice] = "Login successful!"
      redirect_to books_path
    else
      render :action => :new
    end
  end

  def destroy
    current_admin_session.destroy
    flash[:notice] = "Logout successful"
    redirect_to books_path
  end
  private

  def admin_session_params
    params.require(:admin_session).permit!
  end

  def permit!
    each_pair do |key, value|
      convert_hashes_to_parameters(key, value)
      self[key].permit! if self[key].respond_to? :permit!
    end

    @permitted = true
    self
  end

end
