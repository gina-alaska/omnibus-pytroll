name "Python"
version "2.7.4"


source :url => "http://python.org/ftp/python/2.7.4/Python-2.7.4.tgz",
       :md5 => "592603cfaf4490a980e93ecb92bde44a"
      

relative_path "#{name}-#{version}"

dependency "zlib"
dependency "openssl"
dependency "libyaml"
dependency "ncurses"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command [ "./configure", 
            "--prefix=#{install_dir}",
            "--disable-selinux"].join(" "), :env => env
  command "make -j #{max_build_jobs}", :env => env
  # command "make test", :env => env
  command "make install", :env => env
end
