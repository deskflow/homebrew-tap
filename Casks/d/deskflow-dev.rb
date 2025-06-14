cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.50"
  sha256 arm:   "74d9efeff0a39110c6b3bc8976a3fd7651ed586f4864cf10cafce90cc1af5abe", intel: "dc416dd936e3993671df8e692f63a7f87071f8cdbc61ed5d735c73c75caa1406"

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
