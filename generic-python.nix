with import <nixpkgs> { };

(let
  meshio = callPackage ./deps/meshio.nix {
    buildPythonPackage = python37Packages.buildPythonPackage;
    fetchPypi = python37Packages.fetchPypi;
  };
  pygmsh = callPackage ./deps/pygmsh.nix {
    buildPythonPackage = python37Packages.buildPythonPackage;
    fetchPypi = python37Packages.fetchPypi;
    meshio = meshio;
  };
  dmsh = callPackage ./deps/dmsh.nix {
    buildPythonPackage = python37Packages.buildPythonPackage;
    fetchPypi = python37Packages.fetchPypi;
  };
  sksparse = callPackage ./deps/sksparse.nix {
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
  ps.plotly
])
).env
