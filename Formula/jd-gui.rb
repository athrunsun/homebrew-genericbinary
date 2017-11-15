class JdGui < Formula
    desc "A standalone graphical utility that displays Java sources from CLASS files."
    homepage "https://github.com/java-decompiler/jd-gui"
    version "1.4.0"

    url "https://github.com/java-decompiler/jd-gui/releases/download/v#{version}/jd-gui-#{version}.jar"
    sha256 "bdd2f3dc8750910e0d69378482cff57f2ff29d23983d1e55d266390527bd6b67"

    bottle :unneeded

    def install
        prefix.install Dir["*"]
        
        (prefix/"jdgui").write <<-EOS.undent
            #!/usr/bin/env bash
            java -jar "$(brew --prefix jd-gui)/jd-gui-#{version}.jar"
        EOS

        chmod(0755, "#{prefix}/jdgui")
        bin.install_symlink("#{prefix}/jdgui")
    end

    def caveats; <<-EOS.undent
        Executable is linked as "jdgui".
        You need to call "nohup bash -c jdgui >/dev/null 2>&1 &" to run it in the background.
        Please NOTE that jd-gui will create a "jd-gui.cfg" file in the folder where you call that command.
        EOS
    end
end
