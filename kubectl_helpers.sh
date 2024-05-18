# alias
alias k="kubectl"


# functions
function kgpg() {
        if [ "$#" -eq 0 ]; then
                echo "Command: kubectl get pods -A | grep \$1"
        else
                kubectl get pods -A | grep $1
        fi
}

function kgdg() {
        if [ "$#" -eq 0 ]; then
                echo "Command: kubectl get deployment -A | grep \$1"
        else
                kubectl get deployment -A | grep $1
        fi
}

function kdp() {
        if [ "$#" -eq 0 ]; then
                echo "Command: kubectl describe pods \$1 [-n \$2]{default: active namespace} | less"
        else
            if [ "$#" -eq 1 ]; then
                kubectl describe pods $1 | less
            else
                kubectl describe pods $1 -n $2 | less
		fi
        fi
}

function kdd() {
        if [ "$#" -eq 0 ]; then
                echo "Command: kubectl describe deployment \$1 [-n \$2]{default: active namespace} | less"
        else
                if [ "$#" -eq 1 ]; then
                    kubectl describe deployment $1 | less
                else
                    kubectl describe deployment $1 -n $2 | less
		fi
        fi
}

function kgp() {
        if [ "$#" -eq 0 ]; then
                echo "Command: kubectl get pods -o yaml \$1 [-n \$2]{default: active namespace} | less"
        else
                if [ "$#" -eq 1 ]; then
                    kubectl get pods -o yaml $1 | less
                else
                    kubectl get pods -o yaml $1 -n $2 | less
		fi
        fi
}

function kforward() {
        if [ "$#" -le 1 ]; then
                echo "Command: kubectl port-forward $1 $2 [-n \$3]{default: active namespace} | less"
        else
                if [ "$#" -eq 2 ]; then
                    kubectl port-forward $1 $2
                else
                    kubectl port-forward $1 $2 -n $3
		fi
        fi
}

function klogs() {
        if [ "$#" -eq 0 ]; then
                echo "Command: kubectl logs -n \$2 -l app.kubernetes.io/name=\$(k get pods -o json \$1 -n \$2 | jq -r '.metadata.labels.\"app.kubernetes.io/name\"') -f --tail 100 --max-log-requests=50"
        else
                if [ "$#" -eq 1 ]; then
			kubectl logs -l app.kubernetes.io/name=$(k get pods -o json $1| jq -r '.metadata.labels."app.kubernetes.io/name"') -f --tail 100 --max-log-requests=50
                else
			kubectl logs -n $2 -l app.kubernetes.io/name=$(k get pods -o json $1 -n $2 | jq -r '.metadata.labels."app.kubernetes.io/name"') -f --tail 100 --max-log-requests=50
		fi
        fi
}
