defmodule Auth.Mixfile do
  use Mix.Project


  def project do
    [app: :auth,
     version: "0.0.1",
     description: description,
     package: package,
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     compilers: [:gettext] ++ Mix.compilers]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [
      :gettext,
      :poison,
      :postgrex,
      :ecto,
      :prop_types,
      :comeonin],
      mod: {Auth, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:gettext, "~> 0.8"},
      {:poison, "~> 2.2.0"},
      {:postgrex, "~> 0.11.2"},
      {:ecto, "~> 2.0.4"},
      {:prop_types, git: "git://github.com/nathanfaucett/ex-prop_types.git"},
      {:comeonin, "~> 2.5.2"}]
  end

  defp description do
   """
   auth services api for managing users in applications
   """
 end

  defp package do
    [# These are the default files included in the package
      name: :auth,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Nathan Faucett"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/nathanfaucett/ex-auth",
        "Docs" => "https://github.com/nathanfaucett/ex-auth"
      }
    ]
  end
end
