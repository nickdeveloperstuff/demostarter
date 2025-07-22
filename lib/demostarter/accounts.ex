defmodule Demostarter.Accounts do
  use Ash.Domain, otp_app: :demostarter, extensions: [AshAdmin.Domain]

  admin do
    show? true
  end

  resources do
    resource Demostarter.Accounts.Token
    resource Demostarter.Accounts.User
  end
end
