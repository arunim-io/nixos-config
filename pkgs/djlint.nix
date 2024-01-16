{ lib, python313, fetchPypi }: with python313.pkgs; buildPythonApplication rec {
  pname = "djlint";
  version = "1.34.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-25P6AI0Z6q2wRU7fFwSTHRRGnUhQjaui35lBER9Ag0Y=";
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
    homepage = "https://github.com/Riverside-Healthcare/djLint";
    license = licenses.gpl3Only;
    mainProgram = "djlint";
  };
}
