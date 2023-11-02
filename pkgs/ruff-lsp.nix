{ lib, python3Packages, fetchFromGitHub, ruff }: with python3Packages; buildPythonPackage rec {
  pname = "ruff-lsp";
  version = "0.0.41";
  pyproject = true;
  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "astral-sh";
    repo = "ruff-lsp";
    rev = "v${version}";
    hash = "sha256-CQ4SDIGhUTn7fdvoGag+XM7HcY+qJyp9McyzpoTQ0tM=";
  };

  doCheck = false;

  postPatch = ''
    # ruff binary added to PATH in wrapper so it's not needed
    sed -i '/"ruff>=/d' pyproject.toml
  '';

  nativeBuildInputs = [ hatchling ];

  propagatedBuildInputs = [ packaging pygls lsprotocol typing-extensions ];

  nativeCheckInputs = [ pytestCheckHook pytest-asyncio python-lsp-jsonrpc ruff ];

  makeWrapperArgs = [
    # prefer ruff from user's PATH, that's usually desired behavior
    "--suffix PATH : ${lib.makeBinPath [ ruff ]}"

    # Unset ambient PYTHONPATH in the wrapper, so ruff-lsp only ever runs with
    # its own, isolated set of dependencies. This works because the correct
    # PYTHONPATH is set in the Python script, which runs after the wrapper.
    "--unset PYTHONPATH"
  ];

  meta = with lib; {
    description = "A Language Server Protocol implementation for Ruff";
    homepage = "https://github.com/astral-sh/ruff-lsp";
    changelog = "https://github.com/astral-sh/ruff-lsp/releases/tag/v${version}";
    license = licenses.mit;
  };
} 