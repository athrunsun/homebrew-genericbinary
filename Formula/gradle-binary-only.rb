class GradleBinaryOnly < Formula
    desc "Build system based on the Groovy language, this is the binary-only version."
    homepage "https://www.gradle.org/"
    url "https://services.gradle.org/distributions/gradle-4.2-bin.zip"
    sha256 "515dd63d32e55a9c05667809c5e40a947529de3054444ad274b3b75af5582eae"

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
        and is installing with the binary-only zip,
        and omits '--with-all' option which is not available for 'brew upgrade'.
        EOS
    end
end
