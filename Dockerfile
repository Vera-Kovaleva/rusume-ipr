FROM debian:10.3

RUN apt-get update && apt-get install --yes --no-install-recommends \
    build-essential \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-latex-extra \
    texlive-fonts-extra \
    dvipng \
    texlive-latex-recommended \
    texlive-base \
    texlive-pictures \
    texlive-lang-cyrillic \
    texlive-science \
    cm-super \
    texlive-generic-extra

ADD . /cv

CMD pdflatex -interaction=nonstopmode main.tex -o cv.pdf
ENTRYPOINT ["bash"]
