#!/bin/bash

########################################
# 引数
########################################
# 引数とオプションの解析
while (( $# > 0 )); do
  case "$1" in
    --name_space)
      name_space="$2"
      shift 2
      ;;
    --deploy_yaml)
      deploy_yaml="$2"
      shift 2
      ;;
    --config_map_yaml)
      config_map_yaml="$2"
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
log_title "arguments check"
########################################
if [ -z "$name_space" ]; then
    log "エラー: $name_space name_spaceが空です"
    exit 1
fi
if [ -z "$deploy_yaml" ]; then
    log "エラー: $deploy_yaml deploy_yamlが空です"
    exit 1
fi
if [ -z "$config_map_yaml" ]; then
    log "エラー: $config_map_yaml config_map_yamlが空です"
    exit 1
fi

########################################
log_title "undeploy config_map"
########################################
#-----------------------------
log_mini_title "current config_map"
#-----------------------------
exec_func "kubectl get cm -n $name_space"

#-----------------------------
log_mini_title "delete config_map"
#-----------------------------
exec_func "kubectl delete -f $config_map_yaml"

#-----------------------------
log_mini_title "status of config_map"
#-----------------------------
exec_func "kubectl get cm -n $name_space"

########################################
log_title "undeploy deployment"
########################################
#-----------------------------
log_mini_title "current condeploymentfig_map"
#-----------------------------
exec_func "kubectl get deploy -n $name_space"

#-----------------------------
log_mini_title "delete deployment"
#-----------------------------
exec_func "kubectl delete -f $deploy_yaml"

#-----------------------------
log_mini_title "status of deployment"
#-----------------------------
exec_func "kubectl get deploy -n $name_space"

exit 0
