cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.150"
  sha256 arm:   "9465a4b19a7d9065094620bde093806370784c75968b82d3509fa9d22f65ca99", intel: "5f32cecd0fe06f25996e97eb8e49ec92438afdb74e7fdea558987062918cd2e5"

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
