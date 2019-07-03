class YarnBinary < Formula
    desc "JavaScript package manager, binary install (without any dependencies)."
    homepage "https://github.com/yarnpkg/yarn"
    version "1.16.0"

    option "with-taobao-mirror", "Download tarball from https://npm.taobao.org/mirrors/yarn, use this option if you're in mainland China for a faster downloading speed."

    if build.with? "taobao-mirror"
        url "https://npm.taobao.org/mirrors/yarn/v#{version}/yarn-v#{version}.tar.gz"
    else
        url "https://github.com/yarnpkg/yarn/releases/download/v#{version}/yarn-v#{version}.tar.gz"
    end

    sha256 "df202627d9a70cf09ef2fb11cb298cb619db1b958590959d6f6e571b50656029"

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
        Executable is linked as 'yarn' and 'yarnpkg'.
        
        This formula differs from the original one,
        as it doesn't have any dependencies,
        and you can choose to download from either github or China mirror site.
        EOS
    end
end
