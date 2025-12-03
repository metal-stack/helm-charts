#!/usr/bin/env bats -p

@test "deploy csi-driver-lvm" {
    run helm upgrade --install csi-driver-lvm /chart --values values.yaml --wait
    [ "$status" -eq 0 ]
}

@test "tolerations are present" {
    run kubectl get ds csi-driver-lvm -o jsonpath='{.spec.template.spec.tolerations}'
    [ "$status" -eq 0 ]
    [ "$output" = '[{"effect":"PreferNoSchedule","key":"kubernetes.io/os","operator":"Exists"}]' ]
}
