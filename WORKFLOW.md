# HIST430 Course Materials - Editing Guide

## 📁 File Structure

```
HIST430/
├── _data/
│   └── due_dates.yml              # Single source of truth for all due dates
├── assignments/                    # Individual assignment files (EDIT THESE)
│   ├── initial-thoughts.md
│   ├── project-proposal.md
│   ├── primary-source-analysis.md
│   ├── annotated-bibliography.md
│   ├── historiographical-essay.md
│   ├── full-draft.md
│   └── presentations.md
├── media/                          # Images and media files
├── index.md                        # Main syllabus (EDIT THIS)
├── schedule26.md                   # Course schedule (EDIT THIS)
├── FinalPaper.md                   # Combined assignments (AUTO-GENERATED)
├── HIST430_Complete_Syllabus.md   # All 3 files combined (AUTO-GENERATED)
├── update_finalpaper.sh            # Script to rebuild FinalPaper.md
└── generate_syllabus_pdf.sh        # Script to create complete syllabus
```

## ✏️ Where to Make Edits

### 1. **Due Dates** (Change in ONE place, updates everywhere)
- **Edit:** `_data/due_dates.yml`
- **After editing:** 
  - Run `./generate_syllabus_pdf.sh` to update the PDF
  - Push to GitHub - dates will update automatically on the website
  
**Example:**
```yaml
complete_draft: "Thurs, April 16"  # {{ site.data.due_dates.complete_draft }}
```

### 2. **Individual Assignment Instructions**
- **Edit:** Files in `assignments/` folder
  - `assignments/initial-thoughts.md`
  - `assignments/project-proposal.md`
  - `assignments/primary-source-analysis.md`
  - `assignments/annotated-bibliography.md`
  - `assignments/historiographical-essay.md`
  - `assignments/full-draft.md`
  - `assignments/presentations.md`

- **After editing:**
  ```bash
  ./update_finalpaper.sh           # Rebuilds FinalPaper.md
  ./generate_syllabus_pdf.sh       # Updates the complete PDF
  ```

### 3. **General Research Paper Overview**
- **Edit:** The script `update_finalpaper.sh`
- Find the section between `cat > "$OUTPUT"` and the first `EOF`
- This contains the introductory text about the research paper

- **After editing:**
  ```bash
  ./update_finalpaper.sh           # Rebuilds FinalPaper.md
  ./generate_syllabus_pdf.sh       # Updates the complete PDF
  ```

### 4. **Main Syllabus (Policies, Grading, etc.)**
- **Edit:** `index.md`
- **After editing:**
  ```bash
  ./generate_syllabus_pdf.sh       # Updates the complete PDF
  ```

### 5. **Course Schedule**
- **Edit:** `schedule26.md`
- **After editing:**
  ```bash
  ./generate_syllabus_pdf.sh       # Updates the complete PDF
  ```

## 🔄 Workflow Summary

```
┌─────────────────────────────────────┐
│ Make changes to source files:       │
│ - _data/due_dates.yml               │
│ - assignments/*.md                  │
│ - index.md                          │
│ - schedule26.md                     │
└─────────────┬───────────────────────┘
              │
              ↓
┌─────────────────────────────────────┐
│ Run scripts to rebuild:             │
│ ./update_finalpaper.sh              │ ← If you edited assignments/
│ ./generate_syllabus_pdf.sh          │ ← Always run this for PDF
└─────────────┬───────────────────────┘
              │
              ↓
┌─────────────────────────────────────┐
│ Push to GitHub                      │
│ git add .                           │
│ git commit -m "Update syllabus"     │
│ git push                            │
└─────────────────────────────────────┘
```

## 🌐 Using Files in Canvas

### Individual Assignment Pages (for iframes)
Each assignment has its own page that can be embedded in Canvas:

```html
<!-- Initial Thoughts -->
<iframe src="https://proctorf.github.io/HIST430/assignments/initial-thoughts.html" 
  width="100%" height="400"></iframe>

<!-- Project Proposal -->
<iframe src="https://proctorf.github.io/HIST430/assignments/project-proposal.html" 
  width="100%" height="500"></iframe>

<!-- Primary Source Analysis -->
<iframe src="https://proctorf.github.io/HIST430/assignments/primary-source-analysis.html" 
  width="100%" height="900"></iframe>

<!-- Annotated Bibliography -->
<iframe src="https://proctorf.github.io/HIST430/assignments/annotated-bibliography.html" 
  width="100%" height="800"></iframe>

<!-- Historiographical Essay -->
<iframe src="https://proctorf.github.io/HIST430/assignments/historiographical-essay.html" 
  width="100%" height="900"></iframe>

<!-- Full Draft -->
<iframe src="https://proctorf.github.io/HIST430/assignments/full-draft.html" 
  width="100%" height="500"></iframe>

<!-- Presentations -->
<iframe src="https://proctorf.github.io/HIST430/assignments/presentations.html" 
  width="100%" height="800"></iframe>
```

### Direct Links (for Canvas modules)
- Main Syllabus: `https://proctorf.github.io/HIST430/index.html`
- Course Schedule: `https://proctorf.github.io/HIST430/schedule26.html`
- Research Paper: `https://proctorf.github.io/HIST430/FinalPaper.html`

## 📊 How Jekyll Variables Work

### On GitHub Pages (Website)
Variables like `{{ site.data.due_dates.complete_draft }}` automatically get replaced with actual dates from `_data/due_dates.yml`.

**You see:** "Thurs, April 16"

### In VS Code Preview
Variables appear as raw code - **this is normal!**

**You see:** `{{ site.data.due_dates.complete_draft }}`

### In the PDF
The `generate_syllabus_pdf.sh` script automatically replaces all variables with actual dates.

**You see:** "Thurs, April 16"

## 🚀 Quick Reference

### Generate PDF Only
```bash
./generate_syllabus_pdf.sh
```

### After Editing Assignments
```bash
./update_finalpaper.sh
./generate_syllabus_pdf.sh
```

### Check Which Files Changed
```bash
git status
```

### Push Changes to GitHub
```bash
git add .
git commit -m "Update course materials"
git push
```

## 💡 Tips

1. **Always edit the source files** (assignments/, index.md, schedule26.md)
   - Never edit FinalPaper.md or HIST430_Complete_Syllabus.md directly
   - These are auto-generated and will be overwritten

2. **Run scripts after edits**
   - Scripts ensure all versions stay in sync

3. **Jekyll variables won't render in VS Code**
   - This is expected behavior
   - They will work on GitHub Pages and in the PDF

4. **Test on GitHub Pages**
   - After pushing changes, check your live site
   - https://proctorf.github.io/HIST430/

5. **Use Version Control**
   - Commit regularly
   - Write descriptive commit messages
   - You can always revert changes if needed

## 📝 Files You Should NEVER Edit Directly

- ❌ `FinalPaper.md` (generated by update_finalpaper.sh)
- ❌ `HIST430_Complete_Syllabus.md` (generated by generate_syllabus_pdf.sh)
- ❌ `HIST430_Complete_Syllabus.pdf` (generated by generate_syllabus_pdf.sh)

These files are automatically rebuilt by scripts. Your changes will be lost!

---

**Questions?** Review this file anytime you need to make updates to course materials.
