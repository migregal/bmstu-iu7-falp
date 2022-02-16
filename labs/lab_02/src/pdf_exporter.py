from reportlab.lib.colors import blue
from reportlab.lib.pagesizes import LETTER
from reportlab.lib.units import mm
from reportlab.pdfgen.canvas import Canvas
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont

PT_TO_MM = 4.233333333333
PT_X_TO_MM = 3

def create_pdf(text, filename="result.pdf"):
    h = len(text)*PT_TO_MM
    w = max([len(i) for i in text])

    pdfmetrics.registerFont(
        TTFont('Fira Code', '/usr/share/fonts/TTF/FiraCode-Medium.ttf', 'UTF-8'))

    canvas = Canvas(filename, pagesize=(w*PT_X_TO_MM*mm, h*mm))

    canvas.setFont("Fira Code", 13)

    for i in range(len(text)):
        canvas.drawString(0, (h-(i+1)*PT_TO_MM)*mm, text[i])

    canvas.save()
