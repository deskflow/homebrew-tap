cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.184"
  sha256 arm:   "e06e7de3bdb33e3a06ec96c2f387e7531c87f1c92a491adcd6feceeebf8e2df6", intel: "b0ab93710da3994570b757afb6770899e956f688e2a8951d32e437108644b3a9"

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
