{{- define "externalImages.csiAttacher.Version" -}}
{{- if semverCompare ">=1.17-0" .Capabilities.KubeVersion.Version -}}
{{- print "v3.3.0" -}}
{{- else -}}
{{- print "v2.2.1" -}}
{{- end -}}
{{- end -}}

{{- define "externalImages.csiProvisioner.Version" -}}
{{- if semverCompare ">=1.20-0" .Capabilities.KubeVersion.Version -}}
{{- print "v3.0.0" -}}
{{- else if semverCompare ">=1.17-0" .Capabilities.KubeVersion.Version -}}
{{- print "v2.2.2" -}}
{{- else -}}
{{- print "v1.6.1" -}}
{{- end -}}
{{- end }}

{{- define "externalImages.csiLivenessprobe.Version" -}}
{{- print "v2.4.0" -}}
{{- end }}

{{- define "externalImages.csiResizer.Version" -}}
{{- print "v1.3.0" -}}
{{- end }}

{{- define "externalImages.csiNodeDriverRegistrar.Version" -}}
{{- print "v2.3.0" -}}
{{- end }}
