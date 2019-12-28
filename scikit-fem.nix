with import (fetchTarball https://github.com/NixOS/nixpkgs/archive/19.09.tar.gz) { };

let
  meshio = callPackage ./pkgs/meshio.nix {
    buildPythonPackage = python37Packages.buildPythonPackage;
    fetchPypi = python37Packages.fetchPypi;
  };
  pygmsh = callPackage ./pkgs/pygmsh.nix {
    buildPythonPackage = python37Packages.buildPythonPackage;
    fetchPypi = python37Packages.fetchPypi;
    meshio = meshio;
  };
  dmsh = callPackage ./pkgs/dmsh.nix {
    buildPythonPackage = python37Packages.buildPythonPackage;
    fetchPypi = python37Packages.fetchPypi;
  };
  sksparse = callPackage ./pkgs/sksparse.nix {
    buildPythonPackage = python37Packages.buildPythonPackage;
    fetchPypi = python37Packages.fetchPypi;
  };
in python37.withPackages (ps: [
  ps.numpy
  ps.scipy
  ps.matplotlib
  ps.pytest
  meshio
  pygmsh
  dmsh
  sksparse
  ps.ipython
  ps.jupyter
])
