{ lib, python3, fetchFromGitHub }: with python3.pkgs; buildPythonApplication rec {
  pname = "djlint";
  version = "1.34.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Riverside-Healthcare";
    repo = "djLint";
    rev = "v${version}";
    hash = "sha256-iorlA8Ypkzw8NuzOZT5fV3zaqHgyg6ClgQn2VO32q0k=";
  };

  nativeBuildInputs = [ poetry-core ];

  propagatedBuildInputs = [
    click
    colorama
    cssbeautifier
    html-tag-names
    html-void-elements
    jsbeautifier
    json5
    pathspec
    pyyaml
    regex
    tomli
    tqdm
  ];

  pythonImportsCheck = [ "djlint" ];

  meta = with lib; {
    description = "HTML Template Linter and Formatter. Django - Jinja - Nunjucks - Handlebars - GoLang";
    homepage = "https://djlint.com/";
    changelog = "https://github.com/Riverside-Healthcare/djLint/releases/tag/v${version}";
    license = licenses.gpl3Only;
    mainProgram = "djlint";
  };
}
