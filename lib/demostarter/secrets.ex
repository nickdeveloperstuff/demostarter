defmodule Demostarter.Secrets do
  use AshAuthentication.Secret

  def secret_for(
        [:authentication, :tokens, :signing_secret],
        Demostarter.Accounts.User,
        _opts,
        _context
      ) do
    Application.fetch_env(:demostarter, :token_signing_secret)
  end
end
