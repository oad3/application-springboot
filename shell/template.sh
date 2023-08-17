#!/bin/bash

########################################
# 引数
########################################
# デフォルト値の設定
arg_name=""
arg_file=""

# 引数とオプションの解析
while (( $# > 0 )); do
  case "$1" in
    --arg_name)
      arg_name="$2"
      shift 2
      ;;
    --arg_file)
      arg_file="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
  esac
done

########################################
# 共通機能読込
########################################
source ./shell/common/utill.sh

########################################
# 引数チェック
########################################
if [ -z "$arg_name" ]; then
    log "エラー: $arg_name が空です"
    exit 1
fi
if [ ! -e "$arg_file" ]; then
    log "エラー: $arg_file が存在しません: $arg_file"
    exit 1
fi


########################################
log_title "main"
########################################
#-----------------------------
log_mini_title "output val"
#-----------------------------
log "名前: $arg_name"
log "ファイル: $arg_file"
