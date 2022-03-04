#!/bin/bash
set -e

# The install.sh script is the installation entrypoint for any features in this repository. 
#
# The tooling will parse the features.json + user devcontainer, and write 
# any build-time arguments into a feature-set scoped "features.env"
# The author is free to source that file and use it however they would like.
set -a
. ./devcontainer-features.env
set +a

function applyFeature() {

  # Build args are exposed to this entire feature set following the pattern:  _BUILD_ARG_<FEATURE ID>_<OPTION NAME>
  GREETING=${_BUILD_ARG_$1_GREETING:-undefined}

  tee /usr/hello.sh > /dev/null \
  << EOF
  #!/bin/bash
  RED='\033[0;91m'
  NC='\033[0m' # No Color
  echo -e "\${RED}${GREETING}, \$(whoami)!"
  echo -e "\${NC}"
  EOF

  chmod +x /usr/hello.sh
  sudo cat '/usr/hello.sh' > /usr/local/bin/$1
  sudo chmod +x /usr/local/bin/$1
}


if [ ! -z ${_BUILD_ARG_FEATUREA} ]; then
  applyFeature 'FEATUREA'
fi

if [ ! -z ${_BUILD_ARG_FEATUREB} ]; then
  applyFeature 'FEATUREB'
fi

if [ ! -z ${_BUILD_ARG_FEATUREC} ]; then
  applyFeature 'FEATUREC'
fi



