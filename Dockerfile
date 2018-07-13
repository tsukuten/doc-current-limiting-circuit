FROM debian:stretch

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y --no-install-recommends \
      texlive-lang-japanese texlive-latex-extra texlive-pictures latexmk \
 && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
