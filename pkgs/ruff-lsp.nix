{ lib, python3, fetchFromGitHub, ruff }: with python3.pkgs; buildPythonApplication rec {
  pname = "ruff-lsp";
  version = "0.0.45";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "astral-sh";
    repo = "ruff-lsp";
    rev = "v${version}";
    hash = "sha256-jTLkex2K/IQTKZp2duM26/EaYhG5E2bGs/QKt5PA7lc=";
  };

  nativeBuildInputs = [ hatchling ];

  propagatedBuildInputs = [
    lsprotocol
    packaging
    pygls
    ruff
    typing-extensions
  ];

  passthru.optional-dependencies = {
    dev = [
      mypy
      pip-tools
      pytest
      pytest-asyncio
      python-lsp-jsonrpc
    ];
  };

  pythonImportsCheck = [ "ruff_lsp" ];

  meta = with lib; {
    description = "A Language Server Protocol implementation for Ruff";
    homepage = "https://github.com/astral-sh/ruff-lsp";
    changelog = "https://github.com/astral-sh/ruff-lsp/releases/tag/v${version}";
    license = licenses.mit;
    mainProgram = "ruff-lsp";
  };
}
