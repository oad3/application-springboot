#!/bin/bash

########################################
# 引数
########################################
# デフォルト値の設定
url=""
github_token=""

# 引数とオプションの解析
while (( $# > 0 )); do
  case "$1" in
    --url)
      url="$2"
      shift 2
      ;;
    --github_user)
      github_user="$2"
      shift 2
      ;;
    --github_token)
      github_token="$2"
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
echo "url: $url"
echo "github_user: $github_user"
echo "github_token: $github_token"

if [ -z "$url" ]; then
    log "エラー: $url urlが空です"
    exit 1
fi
if [ -z "$github_user" ]; then
    log "エラー: $github_user github_userが空です"
    exit 1
fi
if [ -z "$github_token" ]; then
    log "エラー: $github_token github_tokenが空です"
    exit 1
fi

########################################
log_title "main"
########################################
#-----------------------------
log_mini_title "git clone config repo"
#-----------------------------
r_url=`echo "$url" | sed -e "s/github_user/${github_user}/g"`
r_url=`echo "$r_url" | sed -e "s/github_token/${github_token}/g"`
exec_func "git clone ${r_url}"

#-----------------------------
log_mini_title "ls -la"
#-----------------------------
exec_func "ls -la"

exit 0
