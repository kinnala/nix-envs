{ lib, pkgs, buildPythonPackage, fetchPypi, meshio }:

buildPythonPackage rec {
  pname = "pygmsh";
  version = "6.0.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "08x2pwmh5883lhxj45cllkcvdg92xyb3nr6jfnzsyjp3knspkkcy";
  };

  propagatedBuildInputs = [ pkgs.python37Packages.numpy meshio ];

  meta = with lib; {
    homepage = https://github.com/nschloe/pygmsh;
    description = "Gmsh for Python";
    license = licenses.mit;
  };
}
