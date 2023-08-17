#!/bin/bash

# 一般ログ出力
function log () {
    # ログ出力先とログ名を関数に設定。
    local _log="$(basename $0 | sed -e 's/.sh//g').log"
    local _message=${1}
    # ログ出力日時のフォーマット yyyy/mm/dd hh:mm:ss 
    local _time=$(date '+%Y/%m/%d %T')
    # 最初の引数の文字列をログ出力
    echo -e "${_time}" "${_message}" | tee -a ${_log}
}

# タイトルログ出力
function log_title () {
    local max_length=40
    local message="$1"
    local length=${#message}
    local padding_length=$((max_length - length -3 -3 -2))

    local top_tail_hashes=""
    for ((i = 0; i < max_length; i++)); do
        top_tail_hashes+="#"
    done

    local hashes=""
    for ((i = 0; i < padding_length; i++)); do
        hashes+=" "
    done

    # ヘッダ行
    echo ""
    echo `log "${top_tail_hashes}"`
    # 2行目（引数1を表示し、空白で埋める）
    echo `log "### ${message}${hashes} ###"`
    # フッタ行
    echo `log "${top_tail_hashes}"`
}

# 小タイトルログ出力
function log_mini_title () {
    local max_length=30
    local message="$1"

    local top_tail_hashes=""
    for ((i = 0; i < max_length; i++)); do
        top_tail_hashes+="-"
    done

    # ヘッダ行
    echo ""
    echo `log "${top_tail_hashes}"`
    echo `log "${message}"`
    echo `log "${top_tail_hashes}"`
}

# コマンド実行
function exec_func () {
    local _command=${1}
    echo `log "start ${_command}"`
    ${_command}
    result_cd=${?}
    if [ "0" = ${result_cd} ]; then
        echo `log "正常実行"`
    else
        echo `log "エラー発生"`
        exit 1
    fi
    echo `log "end ${_command}"`
}
