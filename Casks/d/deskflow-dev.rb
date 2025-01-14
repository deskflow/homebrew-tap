cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.71"
  sha256 arm:   "f02632316e04f4ae645b6f535fbf4046519ec2b50f77917abc06ccea3b6f797f", intel: "379f473f8209d74526e56522b6c34c7c5df85822cacc64bcd5d283b1041c06ea"

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
