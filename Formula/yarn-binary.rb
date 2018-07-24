class YarnBinary < Formula
    desc "JavaScript package manager, binary install (without any dependencies)."
    homepage "https://github.com/yarnpkg/yarn"
    version "1.7.0"

    option "with-taobao-mirror", "Download tarball from https://npm.taobao.org/mirrors/yarn/, use this option if you're in mainland China for a faster downloading speed."

    if build.with? "taobao-mirror"
        url "https://npm.taobao.org/mirrors/yarn/#{version}/yarn-v#{version}.tar.gz"
    else
        url "https://github.com/yarnpkg/yarn/releases/download/v#{version}/yarn-v#{version}.tar.gz"
    end

    sha256 "e7720ee346b2bd7ec32b7e04517643c38648f5022c7981168321ba1636f2dca3"

    bottle :unneeded

    conflicts_with "yarn", :because => "both install `yarn` binaries"
    conflicts_with "hadoop", :because => "both install `yarn` binaries"

    def install
        libexec.install Dir["*"]
        bin.install_symlink("#{libexec}/bin/yarn.js" => "yarn")
        bin.install_symlink("#{libexec}/bin/yarn.js" => "yarnpkg")
        inreplace "#{libexec}/package.json", '"installationMethod": "tar"', '"installationMethod": "homebrew"'
    end

    def caveats; <<~EOS
        This formula differs from the original one,
        as it doesn't have any dependencies,
        and is able to download tarball from github or mirror site instead of official site.
        EOS
    end
end
