# This is an example software definition for a C project.
#
# Lots of software definitions for popular open source software
# already exist in `opscode-omnibus`:
#
#  https://github.com/opscode/omnibus-software/tree/master/config/software
#
name "h5py"
version "2.1.3"

dependency "h5py"

source :url => "https://h5py.googlecode.com/files/h5py-2.1.3.tar.gz",
       :md5 => "afd3c14f763339e186dd9cd24eb2eb74"

relative_path "#{name}-#{version}"

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
