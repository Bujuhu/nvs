#!/bin/sh
wkhtmltopdf --header-line --footer-line --footer-right "Seite [page] von [toPage]" --print-media-type http://localhost:4000/reports/5CHIF_20160920_Schreib test.pdf
