cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.62"
  sha256 arm:   "f7f1db565e3be3a4b4527cf82f07d98ecf80a010f40719960ddd00b907080b31", intel: "98bd8c51be184e27b163d0178720dc4a4f8f907fbbde7e1aa669e425cf5ffdbd"

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
