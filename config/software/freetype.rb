# Copyright:: Copyright (c) 2012 University of Alaska Fairbanks
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "freetype"
version "2.4.11"

source :url => "http://download.savannah.gnu.org/releases/freetype/freetype-2.4.11.tar.gz",
       :md5 => "5af8234cf36f64dc2b97f44f89325117"

relative_path "#{name}-#{version}"

build do
  env = { "CFLAGS" => "-I#{install_dir}/embedded/include",
          "LDFLAGS" => "-Wl,-rpath,#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib" }
      
  configure_command = ["./configure",
                        "--prefix=#{install_dir}/embedded" ].join(" ")
                    
  command configure_command, :env => env
  command "make", :env => env
  command "make install", :env => env

end
