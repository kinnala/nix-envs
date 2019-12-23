{
  packageOverrides = pkgs: with pkgs; rec {
    myEmacsConfig = writeText "default.el" (builtins.readFile ./init.el);
    myEmacs = emacsWithPackages (epkgs: (with epkgs.melpaPackages; [
      (runCommand "default.el" {} ''
mkdir -p $out/share/emacs/site-lisp
cp ${myEmacsConfig} $out/share/emacs/site-lisp/default.el
'')
      use-package
      s
      f
      dash
      hydra
      ivy
      counsel
      swiper
      ivy-hydra
      transient
      magit
      which-key
      exec-path-from-shell
      expand-region
      multiple-cursors
      ob-async
      request
      json-mode
      leuven-theme
      highlight-indentation
      yaml-mode
      wgrep
      rainbow-delimiters
      phi-search
      docker
      restclient
      ob-restclient
      htmlize
      diredfl
      python-pytest
      dired-k
      nix-mode
      anaconda-mode
      ivy-pass
    ]));
  };
}
