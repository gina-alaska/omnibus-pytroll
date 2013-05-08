name "pyresample"
version "0.8.0"

dependency "Python"
dependency "numpy"
dependency "setuptools"


source :url => "https://pyresample.googlecode.com/files/pyresample-0.8.0.tar.gz",
       :md5 => "057df261ddfe228206d3a247a21267d1"
      
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
