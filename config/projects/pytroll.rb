
name "pytroll"
maintainer "Scott Macfarlane"
homepage "http://www.gina.alaska.edu"

replaces        "pytroll"
install_path    "/opt/pytroll"
build_version   Omnibus::BuildVersion.new.semver
build_iteration 1

# creates required build directories
dependency "preparation"

# pytroll dependencies/components
# dependency "somedep"
dependency "readline"
dependency "zlib"
dependency "ncurses"
dependency "openssl"
dependency "Python"
dependency "numpy"
dependency "hdf5"
dependency "h5py"
dependency "freetype"
dependency "libpng"
dependency "libtiff"
dependency "proj"
dependency "libgeotiff"
dependency "matplotlib"
dependency "pil"
dependency "geos"
dependency "basemap"
dependency "setuptools"
dependency "mipp"
dependency "pyresample"
dependency "mpop"

# version manifest file
dependency "version-manifest"

exclude "\.git*"
exclude "bundler\/git"
