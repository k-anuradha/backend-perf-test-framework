#!/bin/sh
# create folders if they do not exist
if [ ! -d "../aq_perf" ]; then
  cd ~/u02/
  git clone https://bitbucket.org/abjayonqateam/aq_perf.git
  cd aq_perf
  git checkout develop
fi

chmod 755 ./deploy.sh
./deploy.sh
