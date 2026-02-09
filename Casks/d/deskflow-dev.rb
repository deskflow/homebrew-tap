cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.231"
  sha256 arm:   "b0170b9817d9364d27920334a7478a0d048e06014f455a09df2bf869265402b8", intel: "0addf1361a674d3d68e584d65449257b10b2548aad99b3970442c164e22a595f"

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
