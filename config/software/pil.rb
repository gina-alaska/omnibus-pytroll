# This is an example software definition for a C project.
#
# Lots of software definitions for popular open source software
# already exist in `opscode-omnibus`:
#
#  https://github.com/opscode/omnibus-software/tree/master/config/software
#
name "pil"
version "1.1.7"

dependency "Python"

source :url => "http://effbot.org/downloads/Imaging-1.1.7.tar.gz",
       :md5 => "fc14a54e1ce02a0225be8854bfba478e"

relative_path "Imaging-#{version}"

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
