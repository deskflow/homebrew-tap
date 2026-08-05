cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.353"
  sha256 arm:   "082ba6b3c46f86f15437f90c17d6ada29d17857c60e952e5310da3f2437a9093", intel: "bdc5edc3329736b630431781445f3dcad6c78b8ff0547efa0a1673e647b5bdbc"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
