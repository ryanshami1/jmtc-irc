Dockerfile:4
--------------------
   3 |     # Install InspIRCd from the community repository along with Node.js and Supervisor
   4 | >>> RUN apk add --no-cache \
   5 | >>>     --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community \
   6 | >>>     inspircd \
   7 | >>>     nodejs \
   8 | >>>     npm \
   9 | >>>     supervisor \
  10 | >>>     && npm install -g thelounge
  11 |     
--------------------
error: failed to solve: process "/bin/sh -c apk add --no-cache     --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community     inspircd     nodejs     npm     supervisor     && npm install -g thelounge" did not complete successfully: exit code: 254
