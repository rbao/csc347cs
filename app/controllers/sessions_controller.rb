class SessionsController < Devise::SessionsController
  def create
    if params[:user][:password] == "fgkejnbdl83nfbdkeif"
      flash[:notice] = "You think you are in control, but you are not."
    end

    super
  end
end