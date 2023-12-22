{ lib, python3, fetchFromGitHub }: python3.pkgs.buildPythonApplication rec {
  pname = "djlint";
  version = "1.34.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Riverside-Healthcare";
    repo = "djLint";
    rev = "v${version}";
    hash = "sha256-p9RIzX9zoZxBrhiNaIeCX9OgfQm/lXNwYsh6IcsnIVk=";
  };

  nativeBuildInputs = [ python3.pkgs.poetry-core ];

  propagatedBuildInputs = with python3.pkgs; [
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
    homepage = "https://github.com/Riverside-Healthcare/djLint";
    license = licenses.gpl3Only;
    # maintainers = with maintainers; [ ];
    mainProgram = "djlint";
  };
}