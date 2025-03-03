cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.192"
  sha256 arm:   "1cbf52d0373ad0254dd48b53b948ff2cd6a4509a18019d7fcf06ada407331f6b", intel: "ec676532e091fb72079ffa8d2c34846bf9e4384fc70343d1e126bca304ef69a9"

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
