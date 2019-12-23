{ lib, pkgs, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "meshio";
  version = "3.3.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0qhqvkyxiwicpb0slx6kmfvarajbmfd1a07laxazskm8znnp20y0";
  };

  propagatedBuildInputs = [ pkgs.python37Packages.numpy ];

  meta = with lib; {
    homepage = https://github.com/nschloe/meshio;
    description = "input/output for many mesh formats";
    license = licenses.mit;
  };
}
