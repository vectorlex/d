#!/usr/bin/env bash

set -o noclobber -o noglob -o nounset -o pipefail
IFS=$'\n'

FILE_PATH="${1}"           # Full path of the highlighted file
PV_WIDTH="${2:-80}"        # Width of the preview pane (columns); default 80
PV_HEIGHT="${3:-40}"       # Height of the preview pane (lines);  default 40
X_POS="${4:-0}"
Y_POS="${5:-0}"

FILE_EXTENSION="${FILE_PATH##*.}"
FILE_EXTENSION_LOWER="$(printf "%s" "${FILE_EXTENSION}" | tr '[:upper:]' '[:lower:]')"

# ---------------------------------------------------------------------------
# handle_extension — file-extension-based dispatch
# ---------------------------------------------------------------------------
handle_extension() {
    case "${FILE_EXTENSION_LOWER}" in

        ## Archives
        a|ace|alz|arc|arj|bz|bz2|cab|crx|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|\
        rpm|rz|t7z|rar|7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
            ouch list --tree -- "${FILE_PATH}" && exit 0
            exit 1
            ;;

        ## PDF — text conversion
        pdf)
            pdftotext -l 10 -nopgbrk -q -- "${FILE_PATH}" - \
                | fmt -w "${PV_WIDTH}" && exit 0
            mutool draw -F txt -i -- "${FILE_PATH}" 1-10 \
                | fmt -w "${PV_WIDTH}" && exit 0
            exiftool "${FILE_PATH}" && exit 0
            exit 1
            ;;

        ## HTML
        htm|html|xhtml|json)
            bat --color=always \
                -- "${FILE_PATH}" || true && exit 0
            exit 2
            ;;
    esac
}

# ---------------------------------------------------------------------------
# handle_mime — MIME-type-based dispatch
# ---------------------------------------------------------------------------
handle_mime() {
    local MIMETYPE="${1}"

    case "${MIMETYPE}" in

        ## Plain text and XML — syntax-highlighted
        text/*|*/xml)
            bat --color=always \
                -- "${FILE_PATH}" || true && exit 0
            exit 2
            ;;

        image/*)
            kitten icat --stdin no --transfer-mode memory --place "${PV_WIDTH}x${PV_HEIGHT}@${X_POS}x${Y_POS}" "${FILE_PATH}" </dev/null >/dev/tty
            exit 1
            ;;

        ## Video and audio
        video/*|audio/*)
            kitten icat --stdin no --transfer-mode memory --place "${PV_WIDTH}x${PV_HEIGHT}@${X_POS}x${Y_POS}" "$(~/.config/lf/vidthumb.sh "$FILE_PATH")" </dev/null >/dev/tty
            exit 1
            ;;

        ## ELF binaries and shared objects
        application/x-executable|application/x-pie-executable|application/x-sharedlib)
            readelf -WCa "${FILE_PATH}" && exit 0
            exit 1
            ;;

    esac
}

handle_fallback() {
    echo '----- File Type Classification -----'
    file --dereference --brief -- "${FILE_PATH}" && exit 0
}

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
MIMETYPE="$(file --dereference --brief --mime-type -- "${FILE_PATH}")"

handle_extension
handle_mime "${MIMETYPE}"
handle_fallback

exit 1
