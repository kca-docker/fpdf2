package main

import (
    "encoding/json"
    "fmt"
    "os"

    "codeberg.org/go-pdf/fpdf"
)

func renderValue(pdf *fpdf.Fpdf, key string, v any, indent int) {
    indentStr := ""
    for i := 0; i < indent; i++ {
        indentStr += "  "
    }

    switch val := v.(type) {
    case map[string]any:
        pdf.SetFont("Arial", "B", 12)
        pdf.CellFormat(0, 6, fmt.Sprintf("%s%s", indentStr, key), "", 1, "", false, 0, "")
        for k, child := range val {
            renderValue(pdf, k, child, indent+1)
        }

    case []any:
        pdf.SetFont("Arial", "", 11)
        pdf.CellFormat(0, 6, fmt.Sprintf("%s%s: [Array, %d Elemente]", indentStr, key, len(val)), "", 1, "", false, 0, "")
        for idx, child := range val {
            renderValue(pdf, fmt.Sprintf("[%d]", idx), child, indent+1)
        }

    default:
        pdf.SetFont("Arial", "", 11)
        pdf.MultiCell(0, 5,
            fmt.Sprintf("%s%s: %v", indentStr, key, val),
            "", "L", false)
    }
}

func main() {
    dataBytes, err := os.ReadFile("ppc_settings.json")
    if err != nil {
        panic(err)
    }

    var root map[string]any
    if err := json.Unmarshal(dataBytes, &root); err != nil {
        panic(err)
    }

    pdf := fpdf.New("P", "mm", "A4", "")
    pdf.AddPage()
    pdf.SetFont("Arial", "B", 16)
    pdf.Cell(0, 10, "JSON Report")
    pdf.Ln(12)

    for k, v := range root {
        renderValue(pdf, k, v, 0)
        pdf.Ln(2)
    }

    if err := pdf.OutputFileAndClose("output.pdf"); err != nil {
        panic(err)
    }
}