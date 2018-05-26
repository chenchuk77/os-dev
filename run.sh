#!/bin/bash -e

ASM_FILE=$1
BIN_FILE=$(echo "${ASM_FILE}" | sed 's/.asm/.bin/')
LOG_FILE=$(echo "${ASM_FILE}" | sed 's/.asm/.log/')

function echo_usage {
  echo "use this tool to:"
  echo "1. assemble asm code into binary code, using nasm"
  echo "2. show the binary data"
  echo "3. setup bochsrc in local workspace to boot the above bin"
  echo "4. run bochs"
  echo ""
  echo "usage:"
  echo "./run.sh {filename.asm}"
  echo ""
  echo "example:"
  echo "./run.sh bs.asm"
  echo ""
  exit 1
}

function assmeble {
  nasm ${ASM_FILE} -f bin -o ${BIN_FILE}
}

function config_bochs {
  cat > ./bochsrc << EOF

# Tell bochs to use our boot sector code as though it were
# a floppy disk inserted into a computer at boot time .
floppya: 1_44=/home/chenchuk/dev/os-dev/${BIN_FILE}, status=inserted
boot: a

EOF

}

function log_binary_code {
  echo $(date "+%s")                          >> ${LOG_FILE}
  od -t x1 -A n ${BIN_FILE}                   >> ${LOG_FILE}
  echo "************************************" >> ${LOG_FILE}
  echo ""                                     >> ${LOG_FILE}
}

if [[ -z "${ASM_FILE}" ]] || \
   [[ ! "${ASM_FILE}" =~ ".asm" ]]; then
  echo_usage
fi

### MAIN PROG

assmeble
echo "assembled successfuly."
log_binary_code
config_bochs
bochs
