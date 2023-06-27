
curl -i -X GET \
  'https://app.harness.io/v1/orgs/SE_Sandbox/projects/DanF/services/onyx-test' \
  -H 'Harness-Account: 6_vVHzo9Qeu9fXvj-AcbCQ' \
  -H 'x-api-key: pat.6_vVHzo9Qeu9fXvj-AcbCQ.6499ce1745874c38f551bed7.ODJ5xXNS4uWzIfWjyoMx'


curl -i -X PUT \
  'https://app.harness.io/ng/api/servicesV2?accountIdentifier=6_vVHzo9Qeu9fXvj-AcbCQ' \
  -H 'Content-Type: application/json' \
  -H 'If-Match: string' \
  -H 'x-api-key: pat.6_vVHzo9Qeu9fXvj-AcbCQ.6499ce1745874c38f551bed7.ODJ5xXNS4uWzIfWjyoMx' \
  -d '{
    "name": "onyx-test",
    "identifier": "onyxtest",
    "tags": {},
    "projectIdentifier": "DanF",
    "orgIdentifier": "SE_Sandbox",
    "yaml":'"$updatedyaml"'
  }'


curl -i -X PUT \
  'https://app.harness.io/ng/api/servicesV2?accountIdentifier=string' \
  -H 'Content-Type: application/json' \
  -H 'If-Match: string' \
  -H 'x-api-key: YOUR_API_KEY_HERE' \
  -d '{
    "name": "serviceName",
    "identifier": "serviceId",
    "tags": {},
    "projectIdentifier": "s",
    "orgIdentifier": "default",
    "yaml": "service:\n  name: serviceName\n  identifier: serviceId\n  tags: {}\n  serviceDefinition:\n    spec:\n      artifacts:\n        primary:\n          primaryArtifactRef: artifactName\n          sources:\n            - spec:\n                connectorRef: connectorId\n                imagePath: imagePath\n                tag: tagId\n              identifier: artifactName\n              type: DockerRegistry\n    type: Kubernetes\n"
  }'

curl -i -X PUT \
  'https://app.harness.io/ng/api/servicesV2?accountIdentifier=string' \
  -H 'Content-Type: application/json' \
  -H 'If-Match: string' \
  -H 'x-api-key: YOUR_API_KEY_HERE' \
  -d '{
    "name": "serviceName",
    "identifier": "serviceId",
    "tags": {},
    "projectIdentifier": "s",
    "orgIdentifier": "default",
    "yaml": "  service:\n  name: onyx-test\n  identifier: onyxtest\n  orgIdentifier: SE_Sandbox\n  projectIdentifier: DanF\n  serviceDefinition:\n    spec:\n      manifests:\n        - manifest:\n            identifier: chart\n            type: HelmChart\n            spec:\n              store:\n                type: Http\n                spec:\n                  connectorRef: bitnami\n              chartName: nginx\n              chartVersion: 0.1.0\n              subChartPath: ""\n              helmVersion: V3\n              skipResourceVersioning: false\n              enableDeclarativeRollback: false\n        - manifest:\n            identifier: values\n            type: Values\n            spec:\n              store:\n                type: Github\n                spec:\n                  connectorRef: danf_gh\n                  gitFetchType: Branch\n                  paths: [values\/dev\/blah1.yaml, values\/dev\/blah2.yaml]\n                  repoName: onyx-test\n                  branch: main\n    type: NativeHelm\n\n"
  }'

    testtest=$(echo $test | perl -pe 's/\n/\\\\n/g')

    curl -i -X PUT \
  'https://app.harness.io/ng/api/servicesV2?accountIdentifier=6_vVHzo9Qeu9fXvj-AcbCQ' \
  -H 'Content-Type: application/yaml' \
  -H 'If-Match: string' \
  -H 'x-api-key: pat.6_vVHzo9Qeu9fXvj-AcbCQ.6499ce1745874c38f551bed7.ODJ5xXNS4uWzIfWjyoMx' \
  -d @servicedef2.yaml