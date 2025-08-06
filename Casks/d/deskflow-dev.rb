cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.66"
  sha256 arm:   "c78a85d76589514bfda584aee869a453a7e15c2316eb2e824f3b959b8e82f022", intel: "ec5be4d76f18b609b0914bdf1203598435d870551f568d520a31e6c0dd03b41d"

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
