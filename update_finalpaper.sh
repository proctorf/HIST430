#!/bin/bash
# Script to rebuild FinalPaper.md from individual assignment files
# EDIT ASSIGNMENT FILES in the assignments/ folder, then run this script
# Usage: ./update_finalpaper.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

OUTPUT="FinalPaper.md"
ASSIGNMENTS_DIR="assignments"

echo "Rebuilding FinalPaper.md from individual assignment files..."

# Create the main FinalPaper.md with header and general instructions
cat > "$OUTPUT" << 'EOF'
---
title: Research Paper Instructions
layout: default
---
# Research Paper:<br> 

**DUE: Full Draft:** {{ site.data.due_dates.complete_draft }}
  - DUE: **Revision Plan** {{ site.data.due_dates.revision_plan }}<br>

**DUE: Final Draft** {{ site.data.due_dates.final_paper }}

The primary object of the History Senior Seminar is for you to write an independent, original, research paper fundamentally grounded in primary source materials (20 page + bibliography minimum w/ proper footnotes).  The goal is for this assignment to serve as a culmination of your career at Denison as a student of history. You might conceive of it as your opportunity to write an article-length piece of original scholarship.  For this particular class, the paper must focus on the History of the Atlantic World (which we will define more accurately together over the course of our discussions), 1400-1890, roughly.  The work must be grounded in one or more primary sources and draw widely upon secondary sources (journal articles and books). 

**Warning:** This is not the equivalent of a high school report, it is an opportunity for you to produce original historical research. The research paper is to be fundamentally grounded in primary documents.  It should not be an encyclopedic summary of other historians' arguments or a narrative of events taken from secondary sources, but the presentation of your own arguments based on your readings of available primary sources and the pertinent secondary literature.  Over reliance on secondary sources will adversely affect your grade.

The paper will be graded primarily on the depth, breadth, and quality of your research, the originality of your arguments and their persuasiveness, and the quality of your writing.  

The paper should be typed, double-spaced, and in Times New Roman 12-point font.  It should have 1-inch margins on all sides and employ proper citations in footnotes and the bibliography.  Footnotes and bibliographies should follow the Chicago Manual of Style, 18th ed.  You may use short citations (last name, short title) after an initial full citation of the source has been given.  The paper will be due on Thursday, Dec 22nd, at 11am, but feel free to turn the assignment in early.  Please upload a completed copy of your paper to Canvas.

**Hint:** If you don't already, you might consider using Zotero (a free bibliography program available at zotero.org)

One of the most difficult and yet crucial steps in the process will be to chose a historical problem and conceptualize a plan of how to frame your paper.  Because many of you are not familiar with the history of the Atlantic World you should probably begin by thinking broadly about the types of historical questions, sources, and approaches that have drawn your highest degree of interest during your history career rather than trying to come up with an argument at the start.  You might think of it in terms of what questions/problems within particular national histories you have found most compelling, and, what types of historical approaches or methodologies (women's, economic, gender, race/ethnicity, political, intellectual, etc.) have captured your attention in other courses.  With those ideas in mind, we can begin to brainstorm about the possibilities of conducting research on such a historical or historiographical question within an Atlantic framework.

Fundamental to this process is the locations of manageable and pertinent primary sources.  Once you have a general historical problem you would like to explore, the next and most important step is to identify primary sources.  Your historical questions, and the subsequent answers to those questions (your hypotheses) should emanate out of your reading of the primary sources.

I have provided an initial list of potential published primary sources (and there are so many more that we might find), but you will need to quickly move from a consideration of potential projects/questions to whether or not your project is manageable both in terms of available primary and secondary materials as well as time constraints.  

Once you have settled on a general historical problem (you will be required to submit a Initial Statement of Research Questions and Sources on Sept. 14th) you will need to do lots of reading and note taking and begin to think about what your big historical and/or historiographical questions will be.  Hint: As you read, take copious notes (with reference to exactly what you are reading and where you find it).

At this point, you should still be thinking about questions (derived in large part from you reading of primary materials) rather than arguments.  You will also need to discover if other historians have attempted to answer your questions.  (Email me a Research Proposal and Description on Sept 25th; see description below for specific instructions).

Thereafter, there are a series of benchmark assignments that you will be required to complete in order to help you towards completing your research project.  They will include two (2) Primary Source Analyses (1st Complete Draft Oct 17th, 1st Final Draft Oct 19th; 2nd Complete Draft Nov 9th, Final Draft Nov 14th), an Annotated Bibliography and Historiography Outline (Oct 24th), a Historiographical Essay (Complete Draft Oct 31st, Final Draft Nov 2nd), a rough draft of your paper for peer review (Nov 30th), and finally a Plan for Revision (Due Dec 5th before one-on-one meetings to discuss Rough Drafts).  Specific instructions for each assignment are below.

In writing your final project, it might behoove you to keep the following in mind.
  - Include a theoretical discussion on the concept of the Atlantic world (which can be drawn, in part, from the initial writing assignment)<br>
  - A critical discussion of what an "Atlantic" perspective can or cannot reveal about your general theme and historical questions
  - How, if at all, your perspective on your theme and/or your questions has changed as a result of using an Atlantic World perspective. 
	
***Hints:***
  - Make sure that your opening sentence is well written and that everything in it is factually correct.
  - Ensure that your citations in your footnotes are correct (failure to do so will result in a 1/3 grade penalty)
  - When using long quotes, do not expect them to speak for themselves. You must explain what the quote means to you in the context of your larger argument

***Some Grading Criteria***
  - A paper that is not fundamentally grounded in the examination of primary sources cannot earn higher than a D as a final grade
  - A paper that does not present a historical argument cannot earn higher than a C as a final grade
  - A paper that is not explicitly grounded in an Atlantic World perspective cannot earn higher than a B as a final grade<br>

  - You can find a rubric for the <a href="https://docs.google.com/document/d/1aVjxPIJk0M_yjfpgJ253R7nMTLj4SOLhA38R2bmduS4/edit?usp=sharing" target="_blank">final here</a>

# Assignments Related to Final Project

EOF

# Add each assignment file (skip YAML front matter)
echo "Adding Initial Thoughts..."
echo '<a name="initial-thoughts"></a>' >> "$OUTPUT"
tail -n +5 "$ASSIGNMENTS_DIR/initial-thoughts.md" >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "Adding Project Proposal..."
echo '<a name="project-proposal"></a>' >> "$OUTPUT"
tail -n +5 "$ASSIGNMENTS_DIR/project-proposal.md" >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "Adding Primary Source Analysis..."
echo '<a name="primary-source-analysis"></a>' >> "$OUTPUT"
tail -n +5 "$ASSIGNMENTS_DIR/primary-source-analysis.md" >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "Adding Annotated Bibliography..."
echo '<a name="annotated-bibliography"></a>' >> "$OUTPUT"
tail -n +5 "$ASSIGNMENTS_DIR/annotated-bibliography.md" >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "Adding Historiographical Essay..."
echo '<a name="historiographical-essay"></a>' >> "$OUTPUT"
tail -n +5 "$ASSIGNMENTS_DIR/historiographical-essay.md" >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "Adding Full Draft..."
echo '<a name="full-draft"></a>' >> "$OUTPUT"
tail -n +5 "$ASSIGNMENTS_DIR/full-draft.md" >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "Adding Presentations..."
echo '<a name="presentations"></a>' >> "$OUTPUT"
tail -n +5 "$ASSIGNMENTS_DIR/presentations.md" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Add primary sources list
cat >> "$OUTPUT" << 'EOF'

<a name="primary-sources-list"></a>
## Non-exhaustive list of published primary sources that might serve as starting points for senior research

- Thomas Gage, *Travels in the New World*<br>
- Mawṣilī, Ilyās, *An Arab's journey to colonial Spanish America: the travels of Elias al-Mûsili in the seventeenth century*, trans. and edited by Caesar E. Farah<br>
- Robin Law and Paul E. Lovejoy, eds., *The Biography of Mahommah Gardo Baquaqua* (2001)<br>
- *The Interesting Narrative of the Life of Olaudah Equiano*, edited by Robert J. Allison (Boston, 1995)<br>
- A.O Exquemelin, (aka John Exquemelin) *The history of the buccaneers of America; containing detailed accounts of those bold and daring freebooters; chiefly along the Spanish Main, in the West Indies, and in the great South sea, succeeding the civil wars in England*. Includes accounts by Exquemelin, Basil Ringrose, Ravenau de Lussan and Montauban<br>
- Johnson, Charles (or Daniel Dafoe). *A General History of the Robberies and Murders of the Most Notorious Pyrates* (1727; reprint, 1972)<br>
- Robert Louis Stevenson, *Treasure Island*<br>
- Daniel Defoe, *Captain Singleton*<br>
- Daniel J. Vitkus, ed. *Piracy, slavery, and redemption: Barbary captivity narratives from early modern England*<br>
- Richard Ligon, *A True and Exact History of the Island of Barbadoes*<br>
- Miguel Leon-Portilla, ed. and trans., *The Broken Spears: The Aztec Account of the Conquest of Mexico* (Boston: Beacon Press, 1962, 1990)<br>
- Bernal Diaz, *The Conquest of New Spain*<br>
- James Lockhart, ed. and trans., *We People Here: Nahuatl Accounts of the Conquest of Mexico*<br>
- Hernán Cortés, *Letters from Mexico*, trans. and ed. by Anthony Pagden<br>
- Álvar Núñez Cabeza de Vaca, *The Narrative of Cabeza de Vaca*, trans. and ed. by Rolena Adorno and Patrick Charles Pautz (Lincoln: Univ. of Nebraska Press, 2003)<br>
- Catalina de Erauso, *Lieutenant Nun: Memoir of a Basque Transvestite in the New World*, Michele and Gabriel Stepto, eds., (Boston: Beacon Press, 1996)<br>
- Amerigo Vespucci, *Letters from a New World: Amerigo Vespucci's Discovery of America*, Luciano Formisano, ed, trans.<br>
- Jean de Léry, *History of a Voyage to the Land of Brazil*, Janet Whatley, trans., (Berkeley: Univ. of California Press, 1992)<br>
- *The Jesuit Relations and Allied Documents*. Ed. Reuben Gold Thwaites. 73 vols. (New York: Vanguard Press, 1954)<br>
- Marie de l'Incarnation, *Word from New France: The Selected Letters of Marie de l'Incarnation*, ed. and trans. by Joyce Marshall (Toronto: Oxford University Press, 1967)<br>
- Mary Rowlandson, *The Sovereignty and Goodness of God*<br>
- John Smith, *Captain John Smith: A Select Edition of His Writings*, Karen Ordahl Kupperman, ed.<br>
- Gottlieb Mittelberger, *Journey to Pennsylvania*. Edited and translated by Oscar Handlin and John Clive<br>
- Richard Hakluyt, *The Principall Navigations*<br>
- George Peckham<br>
- Thomas Harriot<br>
- Sir Walter Raleigh<br>
- Gordon Sayre, *American Captivity Narratives*<br>
- Pater C. Mancall, *Travel narratives from the age of discovery: an anthology*<br>
- Bartolomé de Las Casas, Various writings<br>
- Peter Martyr, *The Decades of the Newe Worlde*<br>
- George Best, *A True Discourse of the three Voyages…of Martin Frobisher*<br>
- Arthur Barlowe, *The first voyage made to the coasts of America* (description of Virginia)<br>
- William Strachey, *A True Reportory of the Wreck* (ship wrecked in Bermuda in 1609, wrote one of few narratives describing Powhatan society)<br>
- John Winthrop, "Reasons to be Considered for Justifying the Undertakers of the Intended Plantation in New England"<br>
- John Cotton, *God's Promise to His Plantation* (among other writings)<br>
- Thomas Morton, *New English Canaan*<br>
- Morgan Godwyn, *The Negro and Indian's Advocate, Suing for Their Admission into the Church* (1680) & other writings<br>
- Hans Staden, *Hans Staden's True History*
EOF

echo ""
echo "✓ FinalPaper.md has been rebuilt!"
echo ""
echo "═══════════════════════════════════════════════════════════"
echo "WORKFLOW: Where to make edits"
echo "═══════════════════════════════════════════════════════════"
echo ""
echo "TO EDIT ASSIGNMENTS:"
echo "  → Edit files in assignments/ folder"
echo "  → Run ./update_finalpaper.sh to rebuild FinalPaper.md"
echo ""
echo "TO EDIT GENERAL RESEARCH PAPER INSTRUCTIONS:"
echo "  → Edit this script (update_finalpaper.sh)"
echo "  → Find the section between 'cat > \"\$OUTPUT\"' and 'EOF'"
echo "  → Run ./update_finalpaper.sh to rebuild"
echo ""
echo "THEN run ./generate_syllabus_pdf.sh to update the PDF"
echo "═══════════════════════════════════════════════════════════"
