{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "gwctl";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "kubernetes-sigs";
    repo = "gwctl";
    rev = "v${version}";
    hash = "sha256-7jv3jfdkX1GNsK3CGqFWUHhHxPByfrlJ19SciqjLnHM=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  ldflags = [
    "-s"
    "-w"
    "-X sigs.k8s.io/gwctl/pkg/version.Version=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Command-line tool for managing and understanding Gateway API resources";
    homepage = "https://github.com/kubernetes-sigs/gwctl";
    license = licenses.asl20;
    maintainers = with maintainers; [ rngadam ];
  };
}
