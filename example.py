##Import(s)
from fpdf import FPDF

## Prepare
pdf = FPDF(format="a4")
pdf.set_font('helvetica', size=12)

##Content
pdf.add_page()
pdf.cell(text="hello world")


##Generate PDF
pdf.output("hello_world.pdf")