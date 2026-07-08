cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.304"
  sha256 arm:   "ddb8d420ed8ffedc8ac5287b718e55f371708f4d8abf04b7cb7ffc9aa4efcdb0", intel: "5f8f06e29f2121c1276215ae4d404bcd0d9e339c5c321dc1ca164a3b3febab2d"

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
