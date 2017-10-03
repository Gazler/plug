defmodule Plug.Mixfile do
  use Mix.Project

  @version "1.4.3"

  def project do
    [app: :plug,
     version: @version,
     elixir: "~> 1.3",
     deps: deps(),
     package: package(),
     description: "A specification and conveniences for composable " <>
                  "modules between web applications",
     name: "Plug",
     xref: [exclude: [:ranch, :cowboy, :cowboy_req, :cowboy_router]],
     docs: [extras: ["README.md"], main: "readme",
            groups_for_modules: groups_for_modules(),
            source_ref: "v#{@version}",
            source_url: "https://github.com/elixir-plug/plug"]]
  end

  # Configuration for the OTP application
  def application do
    [applications: [:crypto, :logger, :mime],
     mod: {Plug, []},
     env: [validate_header_keys_during_test: true]]
  end

  def deps do
    [{:mime, "~> 1.0"},
     {:cowboy, "~> 1.0.1 or ~> 1.1", optional: true},
     {:ex_doc, "~> 0.17.1", only: :docs},
     {:inch_ex, ">= 0.0.0", only: :docs},
     {:hackney, "~> 1.2.0", only: :test}]
  end

  defp package do
    %{licenses: ["Apache 2"],
      maintainers: ["José Valim"],
      links: %{"GitHub" => "https://github.com/elixir-plug/plug"}}
  end

  defp groups_for_modules do
    # Ungrouped Modules
    #
    # Plug
    # Plug.Builder
    # Plug.Conn
    # Plug.Crypto
    # Plug.Debugger
    # Plug.ErrorHandler
    # Plug.Exception
    # Plug.HTML
    # Plug.Router
    # Plug.Test
    # Plug.Upload

    [
      "Plugs": [
        Plug.CSRFProtection,
        Plug.Head,
        Plug.Logger,
        Plug.MethodOverride,
        Plug.Parsers,
        Plug.RequestId,
        Plug.SSL,
        Plug.Session,
        Plug.Static,
      ],

      "Parsers": [
        Plug.Parsers.JSON,
        Plug.Parsers.MULTIPART,
        Plug.Parsers.URLENCODED,
      ],

      "Session": [
        Plug.Session.COOKIE,
        Plug.Session.ETS,
        Plug.Session.Store,
      ],

      "Adapters": [
        Plug.Adapters.Cowboy,
        Plug.Adapters.Translator,
      ],

      "Connection helpers": [
        Plug.Conn.Adapter,
        Plug.Conn.Cookies,
        Plug.Conn.Query,
        Plug.Conn.Status,
        Plug.Conn.Unfetched,
        Plug.Conn.Utils,
      ],

      "Crypto": [
        Plug.Crypto.KeyGenerator,
        Plug.Crypto.MessageEncryptor,
        Plug.Crypto.MessageVerifier,
      ],
    ]
  end
end
