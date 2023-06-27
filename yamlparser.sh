#!/bin/bash

#### to be used for repeat function
linecount=$(yq eval ".dev.helm.install[].releaseName" deployment-configuration.yaml | wc -l)
echo $linecount
finalcount=$(($linecount-1))
echo $finalcount


#fetch new data from deployment-configuration.yaml
serviceName=$(yq eval ".dev.helm.install[0].releaseName" deployment-configuration.yaml)
serviceId=
newChartVersion="chartVersion: "$(yq eval ".dev.helm.install[0].version" deployment-configuration.yaml)
#newValues=$(yq eval ".dev.helm.install[0].values" deployment-configuration.yaml)
newValues=$(yq eval ".dev.helm.install[0].values" deployment-configuration.yaml | sed 's;/;\\/;g')  

#replace ChartVersion
originalChartVersion="chartVersion: "$(yq '.' servicedef.yaml | awk '{printf "%s\\n", $0}' | sed 's/.*chartVersion: //; s/subChart.*//')
originalChartVersion=$(echo $originalChartVersion | tr -d '\n' | xargs) 
sed  "s/$originalChartVersion/$newChartVersion/g" servicedef.yaml > servicedef2.yaml

#replace Values.yaml Paths
originalValuesPaths="paths: "$(yq '.' servicedef.yaml | awk '{printf "%s\\n", $0}' | sed 's/.*paths://; s/repo.*//')
originalValuesPaths=$(echo $originalValuesPaths | tr -d '\n') 
perl -i -pe 'BEGIN{undef $/;} s/paths:.*repoName:/paths: ['"$newValues"'] \n                  repoName:/smg' servicedef2.yaml    

#Get updated YAML and format it:
#newServiceDef=$(yq '.' servicedef2.yaml | awk '{printf "%s\\n", $0}')       
#newServiceDef=$(echo $newServiceDef | perl -pe 's;/;\\/;g' | perl -pe 's/\n/\\\\n/g')     

