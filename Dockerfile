FROM debian:10.3 as builder

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

ADD ./cv /cv
WORKDIR /cv

RUN pdflatex -interaction=nonstopmode main.tex -o cv.pdf ; exit 0

FROM scratch
COPY --from=builder /cv/*.pdf .
