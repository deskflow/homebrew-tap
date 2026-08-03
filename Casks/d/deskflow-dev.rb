cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.346"
  sha256 arm:   "b318767de782c8a0c3a19674aa30ff29df58946133f5fc82a1bb471a35f00bfc", intel: "29dadb6f58df0f6265447fe4205373279908191db78fd05830fd886ba1d2221b"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

  app "Deskflow.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "#{appdir}/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
