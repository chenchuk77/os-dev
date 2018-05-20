#!/bin/bash

BIN_FILE=$1

if [[ -z "${BIN_FILE}" ]]; then 
  echo "use this to setup and run bochs with a boot sector bin file."
  exit 99
fi

echo "overriding local ./bochsrc file"
cat > ./bochsrc << EOF

# Tell bochs to use our boot sector code as though it were
# a floppy disk inserted into a computer at boot time .
floppya: 1_44=/home/chenchuk/ws/bochs/${BIN_FILE}, status=inserted
boot: a

EOF

bochs
