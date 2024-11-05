cask "deskflow-dev" do
  arch arm: "arm64", intel: "x64"

  version "1.17.0.173"
  sha256 arm:   "df06e75c99fa27e2bdb2311c51c01addc331fd3c123e5fc71b26d2fe2d1c92db",
         intel: "1bb09aaa2015fd71380801243b717018fe9e0753d12406607319faff7b75ccac"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-#{version}_mac_#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  livecheck do
    url :stable
    regex(/: (\d+\.\d+\.\d+\.\d+(?:\.\d+)$/i)
    strategy :github_releases do |json, regex|
    json.map do |release|
        next if release["draft"]
        match = release["title"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  conflicts_with cask: "deskflow"

  depends_on macos: ">= :monterey"

  app "Deskflow.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "/Applications/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
