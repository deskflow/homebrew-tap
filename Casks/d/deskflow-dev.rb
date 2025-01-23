cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.145"
  sha256 arm:   "51ecec7bc8567c0904ae126f4e14dbc3eaabc662d1d86e36d0f09b01b0276c46", intel: "2a530d1b97350bcad80d567368370d624378f7c1b37903757424983591679d42"

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
