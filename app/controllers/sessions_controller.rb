class SessionsController < Devise::SessionsController
  def create
    if params[:user][:password] == "fgkejnbdl83nfbdkeif"
      flash[:notice] = "Hey hacker, You think you are in control, but you are not. Thanks for giving us your attack techniques."
    end

    super
  end
end