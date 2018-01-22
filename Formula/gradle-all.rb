class GradleAll < Formula
    desc "Build system based on the Groovy language, this is the complete version."
    homepage "https://www.gradle.org/"
    url "https://services.gradle.org/distributions/gradle-4.2-all.zip"
    sha256 "05590c601cca25e75d6fd44e0eb5a5bdb1049a5cb8faec8b2f73cc3c96daeb52"

    bottle :unneeded

    def install
        rm_f Dir["bin/*.bat"]
        libexec.install Dir["*"]
        bin.install_symlink "#{libexec}/bin/gradle"
    end

    test do
        assert_match version.to_s, shell_output("#{bin}/gradle --version")
    end

    def caveats; <<~EOS
        This formula differs from the original one,
        as it doesn't have any dependencies,
        and omits '--with-all' option which is not available for 'brew upgrade'.
        EOS
    end
end
