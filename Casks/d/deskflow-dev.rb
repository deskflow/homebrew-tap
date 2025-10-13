cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.107"
  sha256 arm:   "50cd570c0d2620fb37da8e96732ef14232267d93ca81dee6d12516a7543194fc", intel: "1da346b41e15f13f395890105f487d449d22dbfa242b770eac4bf9c2fae7323f"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: ">= :monterey"

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
