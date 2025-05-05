cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.167"
  sha256 arm:   "62e010120b4088cd40c8626f5676f096aea6a718181ae978900f4f7773c1b71f", intel: "b752dbd7871d9e48e40ccf16cc132b34aa62a6f9a884606ef99e76684af539b7"

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
