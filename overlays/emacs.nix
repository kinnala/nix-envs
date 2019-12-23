self: super: with self; rec {
  myEmacsConfig = writeText "default.el" (builtins.readFile ./init.el);
  myEmacs = emacsWithPackages (epkgs: (with epkgs; [
    (runCommand "default.el" {} ''
mkdir -p $out/share/emacs/site-lisp
cp ${myEmacsConfig} $out/share/emacs/site-lisp/default.el
'')
    melpaPackages.use-package
    melpaPackages.hydra
    melpaPackages.ivy
    melpaPackages.counsel
    melpaPackages.swiper
    melpaPackages.transient
    melpaPackages.magit
    melpaPackages.which-key
    melpaPackages.exec-path-from-shell
    melpaPackages.expand-region
    melpaPackages.multiple-cursors
    melpaPackages.json-mode
    melpaPackages.leuven-theme
    melpaPackages.highlight-indentation
    melpaPackages.yaml-mode
    melpaPackages.wgrep
    melpaPackages.phi-search
    melpaPackages.docker
    melpaPackages.restclient
    melpaPackages.ob-restclient
    melpaPackages.htmlize
    melpaPackages.diredfl
    melpaPackages.python-pytest
    melpaPackages.dired-k
    melpaPackages.nix-mode
    melpaPackages.anaconda-mode
    melpaPackages.ivy-pass
    elpaPackages.csv-mode
  ]));
}
