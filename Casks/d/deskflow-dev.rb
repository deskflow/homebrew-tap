cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.1"
  sha256 arm:   "bed7a54fa4e11adafc88045133d61549a323c898704833a915a5b4913bf1607d", intel: "bcecae5a480ffebce5fa4529d81750f6cd8a504ba2323b7117379648863accb4"

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
