{ lib, pkgs, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "dmsh";
  version = "0.1.6";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1f4zimlqwnjq6b6g8vnx9g9nrpgrzjbv1ggmn7kz3rgqf0m1r9cy";
  };

  propagatedBuildInputs = [
    pkgs.python37Packages.numpy
    pkgs.python37Packages.scipy
  ];

  meta = with lib; {
    homepage = https://github.com/nschloe/dmsh;
    description = "Simple mesh generator inspired by distmesh.";
    license = licenses.mit;
  };
}
