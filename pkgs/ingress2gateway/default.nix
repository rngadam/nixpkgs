{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "ingress2gateway";
  version = "1.0.0-rc1";

  src = fetchFromGitHub {
    owner = "kubernetes-sigs";
    repo = "ingress2gateway";
    rev = "v${version}";
    hash = "sha256-h73+Ux6gIv/ShVr+35KphoWu+mlfqESjv1w4Yb8OlvU=";
  };

  # Updated for v1.0.0-rc1 dependencies
  vendorHash = "sha256-GkI58/Nyvah5biqnVWCv3bfhxjN/ErJ9DcNVnHcipfc=";

  ldflags = [
    "-s" "-w"
    "-X sigs.k8s.io/ingress2gateway/pkg/version.Version=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "A tool to convert Ingress resources to Gateway API resources";
    homepage = "https://github.com/kubernetes-sigs/ingress2gateway";
    license = licenses.asl20;
    maintainers = with maintainers; [ rngadam ];
  };
}
