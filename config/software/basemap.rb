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
#limitations under the License.
#

name "basemap"
version "1.0.6"

source :url => "http://downloads.sourceforge.net/project/matplotlib/matplotlib-toolkits/basemap-1.0.6/basemap-1.0.6.tar.gz?r=&ts=1367710263&use_mirror=superb-dca3",
       :md5 => "fc71c96c76eb8208cafce84d6532ee1b"

relative_path "#{name}-#{version}"

dependency 'Python'
dependency 'numpy'
dependency 'matplotlib'
dependency 'geos'
dependency 'pil'
 
build do
  env = { "LDFLAGS" => "-Wl,-rpath,#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
          "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
          "PKG_CONFIG_PATH" => "#{install_dir}/embedded/lib/pkgconfig",
          "GEOS_DIR" => "#{install_dir}/embedded/lib" }
      
  command [ "#{install_dir}/bin/python",
            "setup.py",
            "install --prefix=#{install_dir}/embedded/" ].join(" "), :env => env
end
