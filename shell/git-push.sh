#!/bin/bash

########################################
# 引数
########################################
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
    --github_repo)
      github_repo="$2"
      shift 2
      ;;
    --github_email)
      github_email="$2"
      shift 2
      ;;
    --github_name)
      github_name="$2"
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
if [ -z "$url" ]; then
    log "エラー: $url url が空です"
    exit 1
fi
if [ -z "$github_user" ]; then
    log "エラー: $github_user github_user が空です"
    exit 1
fi
if [ -z "$github_repo" ]; then
    log "エラー: $github_repo github_repo が空です"
    exit 1
fi
if [ -z "$github_email" ]; then
    log "エラー: $github_email github_email が空です"
    exit 1
fi
if [ -z "$github_name" ]; then
    log "エラー: $github_name github_name が空です"
    exit 1
fi

########################################
log_title "main"
########################################
#-----------------------------
log_mini_title "git push config repo"
#-----------------------------
r_url=`echo "$url" | sed -e "s/github_user/${github_user}/g"`
r_url=`echo "$r_url" | sed -e "s/github_token/${github_token}/g"`
cd $github_repo
exec_func "git config --global user.email $github_email"
exec_func "git config --global user.name $github_name"
exec_func "git add :"
# git commit -a -m "Count Up Build Num"
exec_func "git commit -a -m CountUp-BuildNum"

#-----------------------------
log_mini_title "git push config repo"
#-----------------------------
exec_func "git push ${r_url} --all"

exit 0
