cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.159"
  sha256 arm:   "252e47f97a33d174c92a1e665d0d2fefa31a573ae91cec82286dde9b3d52ae72", intel: "dcc49fd8fb72bba6990235c4b127823d5861e69b677d8b9efc32055bcb8d7bbc"

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
