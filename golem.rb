class Golem < Formula
  desc 'Golem Worldwide Supercomputer'
  homepage 'https://github.com/golemfactory/golem-dev/'
  url 'https://github.com/golemfactory/golem-dev/releases/download/0.9.0/golem-macos-0.9.0.tar.gz'
  sha256 '90490246519d421caf3fca3436d1c643dcc320b8a576d0d8ff7633bffe304a16'
  version '0.9.0'

  depends_on 'docker'
  depends_on 'docker-machine'
  depends_on 'xhyve'
  depends_on 'docker-machine-driver-xhyve'
  depends_on 'gmp'
  depends_on 'openexr'
  depends_on 'freeimage'
  depends_on 'golemfactory/hyperg/hyperg'
  depends_on 'openssl'
  depends_on 'ethereum/ethereum/ethereum'

  def install

    bin.install 'golemapp'
    bin.install 'golemcli'
    bin.install Dir['*']

  end

  def post_install

    # docker-machine-driver-xhyve need root owner and uid
    # https://github.com/zchee/docker-machine-driver-xhyve

    opoo "\n\n\nPLEASE EXECUTE THE FOLLOWING COMMANDS MANUALLY:
    sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
    sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve \n\n\n"

  end

end
