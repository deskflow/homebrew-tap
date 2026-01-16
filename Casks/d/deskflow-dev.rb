cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.162"
  sha256 arm:   "a11a3cf7765b810cf78a944e89fdcfc1e1107f2933c8a99783b342aa8a6f2d57", intel: "3c5501778639823f9bc7fe597afe77c62f6768fa73680f74af039f6cb577cc2e"

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
