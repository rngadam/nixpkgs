# rngadam/nixpkgs

My personal [Nix Flake](https://nixos.org) repository. This collection contains custom derivations, updated versions of upstream packages, and experimental tools that are not yet available in the official Nixpkgs channels.

## 🚀 Quick Start

You can run any package in this repository directly without permanent installation.

### ⚡ Cachix Cache

To speed up installations, you can use my Cachix cache. To configure it:

```bash
cachix use rngadam
```

Or, if you aren't using `cachix`, add the following to your `nix.conf` or flake config:

```nix
extra-substituters = https://rngadam.cachix.org
extra-trusted-public-keys = rngadam.cachix.org-1:KqFeZFfObicjXMg6E9nf02vjWe+zoSqstGJa9pRX8tc=
```

### Run ingress2gateway (v1.0.0-rc1)

```bash
nix run github:rngadam/nixpkgs#ingress2gateway
```

🛠️ Included Packages

| Package | Version | Description |
|---|---|---|
| ingress2gateway | 1.0.0-rc1 | Updated translation tool for Kubernetes Gateway API. |

💻 Supported Systems
This flake is configured for multi-platform support, ensuring binaries work across:

* Linux: x86_64-linux, aarch64-linux
* macOS: x86_64-darwin, aarch64-darwin (Apple Silicon)

📦 Usage as a Flake Input [1] 
To use these packages in your own Nix configuration, add this repository to your flake.nix:

```nix
{
  inputs.rng-pkgs.url = "github:rngadam/nixpkgs";

  outputs = { self, nixpkgs, rng-pkgs }: {
    # Use rng-pkgs.packages.${system}.ingress2gateway in your config
  };
}
```

❄️ Local Development
To build a package locally for testing:

```bash
nix build .#ingress2gateway
```

📜 License
Unless otherwise specified, the Nix expressions in this repository are licensed under the MIT License. The underlying software being packaged (e.g., ingress2gateway) maintains its original license (Apache 2.0).

[1] [https://github.com](https://github.com/nix-community/nixpkgs-xr)
