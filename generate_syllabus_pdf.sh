#!/bin/bash
# Script to combine course materials into a single markdown file and convert to PDF
# Usage: ./generate_syllabus_pdf.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

OUTPUT_MD="HIST430_Complete_Syllabus.md"
OUTPUT_PDF="HIST430_Complete_Syllabus.pdf"

echo "Combining course materials..."

# Create combined markdown file
cat > "$OUTPUT_MD" << 'EOF'
---
title: "HIST 430 - Senior Seminar: Pirates, Slaves, and Revolutionaries"
author: Professor Frank "Trey" Proctor III
date: Spring 2026
geometry: margin=1in
fontsize: 12pt
---

EOF

# Add index content (skip YAML front matter)
echo "Adding syllabus content..."
tail -n +5 index.md >> "$OUTPUT_MD"

# Add page break and schedule
echo -e "\n\n\\newpage\n\n# Course Schedule\n" >> "$OUTPUT_MD"
echo "Adding course schedule..."
tail -n +5 schedule26.md >> "$OUTPUT_MD"

# Add page break and paper instructions
echo -e "\n\n\\newpage\n" >> "$OUTPUT_MD"
echo "Adding research paper instructions..."
tail -n +5 FinalPaper.md >> "$OUTPUT_MD"

echo "Replacing Jekyll variables with actual dates..."

# Replace Jekyll liquid variables with actual dates from due_dates.yml
if [ -f "_data/due_dates.yml" ]; then
    sed -i '' 's/{{ site\.data\.due_dates\.essay_what_is_atlantic_history }}/Thurs, Jan 22/g' "$OUTPUT_MD"
    sed -i '' 's/{{ site\.data\.due_dates\.essay_revised }}/Tues, Feb 3/g' "$OUTPUT_MD"
    sed -i '' 's/{{ site\.data\.due_dates\.initial_thoughts_topic }}/Mon, Feb 2 at 11:59pm/g' "$OUTPUT_MD"
    sed -i '' 's/{{ site\.data\.due_dates\.project_proposal_draft }}/Tues, Feb 17/g' "$OUTPUT_MD"
    sed -i '' 's/{{ site\.data\.due_dates\.project_proposal_final }}/Tues, Feb 24/g' "$OUTPUT_MD"
    sed -i '' 's/{{ site\.data\.due_dates\.source_analysis_1_draft }}/Tues, March 3/g' "$OUTPUT_MD"
    sed -i '' 's/{{ site\.data\.due_dates\.source_analysis_1_final }}/Thurs, March 5/g' "$OUTPUT_MD"
    sed -i '' 's/{{ site\.data\.due_dates\.annotated_bibliography }}/Tues, March 10/g' "$OUTPUT_MD"
    sed -i '' 's/{{ site\.data\.due_dates\.historiography_draft }}/Tues, March 24/g' "$OUTPUT_MD"
    sed -i '' 's/{{ site\.data\.due_dates\.historiography_final }}/Thurs, March 26/g' "$OUTPUT_MD"
    sed -i '' 's/{{ site\.data\.due_dates\.source_analysis_2_draft }}/Thurs, April 2/g' "$OUTPUT_MD"
    sed -i '' 's/{{ site\.data\.due_dates\.source_analysis_2_final }}/Tues, April 7/g' "$OUTPUT_MD"
    sed -i '' 's/{{ site\.data\.due_dates\.complete_draft }}/Thurs, April 16/g' "$OUTPUT_MD"
    sed -i '' 's/{{ site\.data\.due_dates\.revision_plan }}/Before individual meetings (Wednesday April 22 @ 11:59pm)/g' "$OUTPUT_MD"
    sed -i '' 's/{{ site\.data\.due_dates\.presentations }}/Thurs, April 30 (10am-12noon)/g' "$OUTPUT_MD"
    sed -i '' 's/{{ site\.data\.due_dates\.final_paper }}/Wed, May 6 at 11am/g' "$OUTPUT_MD"
    echo "Dates replaced successfully."
else
    echo "WARNING: _data/due_dates.yml not found. Jekyll variables will not be replaced."
fi

echo "Combined markdown created: $OUTPUT_MD"

# Check for PDF conversion tools
if command -v pandoc &> /dev/null; then
    echo "Converting to PDF using pandoc..."
    pandoc "$OUTPUT_MD" -o "$OUTPUT_PDF" \
        --pdf-engine=pdflatex \
        --variable urlcolor=blue \
        --variable linkcolor=blue \
        --toc \
        --toc-depth=2 \
        -V geometry:margin=1in
    echo "PDF created: $OUTPUT_PDF"
elif command -v wkhtmltopdf &> /dev/null; then
    echo "Converting to PDF using wkhtmltopdf..."
    # First convert markdown to HTML, then to PDF
    if command -v markdown &> /dev/null; then
        markdown "$OUTPUT_MD" > "${OUTPUT_MD%.md}.html"
        wkhtmltopdf "${OUTPUT_MD%.md}.html" "$OUTPUT_PDF"
        rm "${OUTPUT_MD%.md}.html"
        echo "PDF created: $OUTPUT_PDF"
    else
        echo "ERROR: markdown command not found. Cannot convert to HTML."
        echo "Markdown file created but PDF conversion skipped."
    fi
else
    echo ""
    echo "═══════════════════════════════════════════════════════════"
    echo "WARNING: No PDF converter found!"
    echo "═══════════════════════════════════════════════════════════"
    echo ""
    echo "The combined markdown file has been created: $OUTPUT_MD"
    echo ""
    echo "To convert to PDF, you have several options:"
    echo ""
    echo "1. Install pandoc (recommended):"
    echo "   brew install pandoc"
    echo "   brew install --cask basictex  # (for pdflatex)"
    echo ""
    echo "2. Use VS Code extension:"
    echo "   - Install 'Markdown PDF' extension"
    echo "   - Open $OUTPUT_MD"
    echo "   - Right-click and select 'Markdown PDF: Export (pdf)'"
    echo ""
    echo "3. Use an online converter:"
    echo "   - Upload $OUTPUT_MD to https://www.markdowntopdf.com/"
    echo ""
    echo "4. Open in Word/Pages and export as PDF:"
    echo "   - Many word processors can open .md files"
    echo ""
    echo "═══════════════════════════════════════════════════════════"
fi

echo ""
echo "Done! Files created:"
echo "  - $OUTPUT_MD (combined markdown)"
if [ -f "$OUTPUT_PDF" ]; then
    echo "  - $OUTPUT_PDF"
fi
