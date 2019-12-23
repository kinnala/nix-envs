{ lib, pkgs, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "scikit-sparse";
  version = "0.4.4";

  src = fetchPypi {
    inherit pname version;
    sha256 = "06gk9pn8x2s8qnhg0mcf61rh7mn9a1i7sg8j3q3l6gx4n0d79rp9";
  };

  buildInputs = [
    pkgs.suitesparse
    pkgs.python37Packages.cython
    pkgs.python37Packages.nose
  ];

  propagatedBuildInputs = [
    pkgs.python37Packages.numpy
    pkgs.python37Packages.scipy
  ];

  meta = with lib; {
    homepage = https://github.com/scikit-sparse/scikit-sparse/;
    description = "Sparse matrix tools extending scipy.sparse, but with incompatible licenses";
    license = licenses.bsd2;
  };
}
