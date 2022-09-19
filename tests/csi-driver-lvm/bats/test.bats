#!/usr/bin/env bats -p

@test "deploy csi-lvm-controller" {
    run helm upgrade --install csi-driver-lvm /chart --values values.yaml --wait
    [ "$status" -eq 0 ]
}

@test "tolerations are present" {
    run kubectl get ds csi-driver-lvm-plugin -o jsonpath='{.spec.template.spec.tolerations}'
    [ "$status" -eq 0 ]
    [ "$output" = '[{"effect":"PreferNoSchedule","key":"kubernetes.io/os","operator":"Exists"}]' ]
}

@test "provisioner tolerations are present" {
    run kubectl get sts csi-driver-lvm-controller -o jsonpath='{.spec.template.spec.tolerations}'
    [ "$status" -eq 0 ]
    [ "$output" = '[{"effect":"PreferNoSchedule","key":"kubernetes.io/os","operator":"Exists"}]' ]
}

@test "provisioner node selector is present" {
    run kubectl get sts csi-driver-lvm-controller -o jsonpath='{.spec.template.spec.nodeSelector}'
    [ "$status" -eq 0 ]
    [ "$output" = '{"kubernetes.io/os":"linux"}' ]
}
