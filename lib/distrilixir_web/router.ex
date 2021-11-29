defmodule DistrilixirWeb.Router do
  use DistrilixirWeb, :router

  import DistrilixirWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :public_layout do
    plug :put_root_layout, {DistrilixirWeb.LayoutView, :root}
  end

  pipeline :admin_layout do
    plug :put_layout, {DistrilixirWeb.AdminLayoutView, :admin}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/", DistrilixirWeb do
  #   pipe_through :browser

  #   get "/", PageController, :index
  # end

  # Other scopes may use custom stacks.
  # scope "/api", DistrilixirWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:browser, :require_authenticated_user]
      live_dashboard "/dashboard", metrics: DistrilixirWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  scope "/", DistrilixirWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    get "/users/register", UserRegistrationController, :new
    post "/users/register", UserRegistrationController, :create
    get "/users/log_in", UserSessionController, :new
    post "/users/log_in", UserSessionController, :create
    get "/users/reset_password", UserResetPasswordController, :new
    post "/users/reset_password", UserResetPasswordController, :create
    get "/users/reset_password/:token", UserResetPasswordController, :edit
    put "/users/reset_password/:token", UserResetPasswordController, :update
  end

  scope "/", DistrilixirWeb do
    pipe_through [:browser, :require_authenticated_user]

    get "/users/settings", UserSettingsController, :edit
    put "/users/settings", UserSettingsController, :update
    get "/users/settings/confirm_email/:token", UserSettingsController, :confirm_email

  end

  scope "/", DistrilixirWeb do
    pipe_through [:browser, :public_layout]

    get "/", PageController, :index

    delete "/users/log_out", UserSessionController, :delete
    get "/users/confirm", UserConfirmationController, :new
    post "/users/confirm", UserConfirmationController, :create
    get "/users/confirm/:token", UserConfirmationController, :edit
    post "/users/confirm/:token", UserConfirmationController, :update
  end

  scope "/admin", DistrilixirWeb.Admin do
    pipe_through [:browser, :require_authenticated_user, :admin_layout]

    resources "/ciudades", CityController
    resources "/estados", StateController

    resources "/distribuidores", DistributorController

    resources "/existencias", StockController

    resources "/solicitudes-de-cotizacion", QuoteRequestController
  end
end
