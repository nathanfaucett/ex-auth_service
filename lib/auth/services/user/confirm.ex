defmodule Auth.Services.User.Confirm do
  import Auth.Gettext


  def prop_types do
    %{
      "locale" => PropTypes.required(PropTypes.string),
      "id" => PropTypes.required(PropTypes.string),
      "confirmation_token" => PropTypes.required(PropTypes.string)
    }
  end

  def call(params) do
    errors = PropTypes.check(params, prop_types, "#{__MODULE__}")

    if errors != nil do
      {:error, errors}
    else
      Gettext.put_locale(Auth.Gettext, Map.get(params, "locale"))

      user = Auth.Repo.get_by(Auth.Models.User, id:  Map.get(params, "id"))

      if user == nil do
        {:error, %{"errors" => [RuntimeError.exception(dgettext("errors", "User not found"))]}}
      else
        if Map.get(user, :confirmation_token) != Map.get(params, "confirmation_token") do
          {:error, %{"errors" => [RuntimeError.exception(dgettext("errors", "Invalid Confirmation Token"))]}}
        else
          {ok, confirmed_user} = Auth.Repo.update(Auth.Models.User.changeset(user, %{
            :confirmed => true,
            :confirmation_token => nil
          }))

          if ok == :ok do
            {:ok, confirmed_user}
          else
            {:error, %{"errors" => [RuntimeError.exception(dgettext("errors", "Internal Error"))]}}
          end
        end
      end
    end
  end
end
