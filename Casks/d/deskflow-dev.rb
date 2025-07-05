cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.130"
  sha256 arm:   "8095d852bdafd63cc1bb75b0771becb5f536e929a02e13506dd5fbf8f53e6b9b", intel: "b5635f062c787b585f80d0324a19e57a754b6814d1e4bc3c77f593ced9def53d"

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
