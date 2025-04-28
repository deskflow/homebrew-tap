cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.36"
  sha256 arm:   "a1bae4b7aca0bf0ae6dce4d72f79dd5f42ca04d1087b80e83077d6387b621702", intel: "a9466b2b9cf7b05be646aa5a9ea42e4acc4fef4a98104e683867dd437c9f805d"

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
