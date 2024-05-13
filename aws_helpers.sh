function getprofile() {
	if [ "$#" -eq 0 ]; then
		echo "Usage: getprofile <search_string>"
	else
		cat ~/.aws/config | grep -A2 $1
	fi
}

function getclusters() {
	if [ "$#" -eq 0 ]; then
		echo "Usage: getclusters <profile> <region: default us-east-1"
	else
		profile=$1
		if [ "$#" -eq 1 ]; then
			region="us-east-1"
		else
			region=$2
		fi
		aws eks list-clusters --profile $profile --region $region
	fi
}
function addctx() {
	if [ "$#" -eq 0 ]; then
		echo "Usage: addctx <profile> <cluster> <region: default us-east-1>"
	else
		profile=$1
		cluster=$2
		if [ "$#" -eq 2 ]; then
			region='us-east-1'
		else
			region=$3
		fi
		aws eks update-kubeconfig --region $region --name $cluster --profile $profile
	fi
}
