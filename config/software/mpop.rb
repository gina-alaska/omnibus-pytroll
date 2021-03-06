name "mpop"
version "pre-master"

dependency "Python"
dependency "hdf5"
dependency "h5py"
dependency "setuptools"
dependency "pyresample"
dependency "libgeotiff"
#dependency "hdf-eos"


source :git => "git://github.com/mraspaud/mpop"

relative_path "#{name}"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command [ "#{install_dir}/bin/python", 
            "setup.py", 
            "install", 
            "--prefix=#{install_dir}" ].join(" "), :env => env
end
