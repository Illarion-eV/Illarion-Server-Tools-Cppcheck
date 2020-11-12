# Illarion-Server-Tools-Cppcheck

##### Run:
`docker run -v <path to source>:/src ghcr.io/illarion-ev/illarion-server-tools-cppcheck cppcheck <cppcheck parameters>`

##### cppcheck parameters for Illarion server repo:
`--std=c++17 --enable=warning,style,performance,portability --inconclusive -Isrc src`
