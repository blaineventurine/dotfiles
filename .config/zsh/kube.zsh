function hl() { helm list "$@"; }
function hh() { helm history "$(helm list -q "$@")"; }
# function gcm() { kubectl get configmap $@ -o yaml; }
function klfl() { kubectl logs --tail="$@"  -f; }

#first arg is namespace, 2nd is name of pod to search for
function klogs() {
  result=("$(kubectl get pod -n "$1" | grep "$2" | head -1 | cut -d ' ' -f 1)")
  exitCode=$?
  if [ ! "$exitCode" -eq 0 ]; then
    echo "Could not find pod matching [$2]."
    return 1;
  fi
(kubectl logs --tail=100 -f "$result" -n "$1" &) | tee
}

function kfp() { kubectl get pod -o wide -n "$1" | grep "$2"; }

function kfs() { kubectl get service -o wide -n "$1" | grep "$2"; } 

function kfd() { kubectl get deployment -o wide -n "$1" | grep "$2"; }

function get-pod() {
  pod=$(kubectl get pod -n "$1" | grep "$2" | head -1 | cut -d ' ' -f 1)
}

function delete-deploy() {
  kubectl config use-context purple.redcanary.io-aws
  for file in ./components/"$1"/deploy/**/*.yaml; do
    echo "$file";
     if read -q "choice?Press Y/y to delete deploy: "; then
      echo "\nDeleting deploy: $file\n"
      kubectl delete -n default -f "$file"
    else
        echo "\nSkipping $file\n"
    fi
  done
  local formattedName=${1//_/-}
  local secrets=("$(kubectl get secrets | grep "$formattedName" | cut -d ' ' -f 1)")
  secrets=("${secrets[@]%%:*}")
  for secret in "${secrets[@]}"; do
     if read -q "choice?Press Y/y to delete secret: "; then
      echo "\nDeleting secret: $secret\n"
      kubectl delete secret "$secret"
    else
      echo "\nSkipping $secret\n"
    fi
    echo "$secret"
  done
}

function count-pods() {
  kubectl get pods -n "$1" | grep "$2" | awk '{print $1}' | wc -l
}
