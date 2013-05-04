#
# Copyright:: Copyright (c) 2012 University of Alaska Fairbanks.
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

name "matplotlib"
version "1.2.1"

source :url => "http://downloads.sourceforge.net/project/matplotlib/matplotlib/matplotlib-1.2.1/matplotlib-1.2.1.tar.gz?r=http%3A%2F%2Fmatplotlib.org%2Fdownloads.html&ts=1367625884&use_mirror=iweb",
       :md5 => "326a959c4c3f85417a3daf805cfb54f9"

relative_path "#{name}-#{version}"

dependency 'Python'
dependency 'numpy'
dependency 'libpng'
dependency 'freetype'

build do
  env = { "LDFLAGS" => "-Wl,-rpath,#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
          "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
          "PKG_CONFIG_PATH" => "#{install_dir}/embedded/lib/pkgconfig" }
      
  command [ "#{install_dir}/bin/python",
            "setup.py",
            "install --prefix=#{install_dir}/embedded/" ].join(" "), :env => env
end
