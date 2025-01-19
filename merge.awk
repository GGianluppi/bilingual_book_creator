BEGIN {
    PdfLeft  = ARGV[1]
    PdfRight = ARGV[2]

    if (!fileExists(PdfLeft) || !fileExists(PdfRight)) {
        print "Error: One or both PDF files do not exist." >> "/dev/stderr"
        exit 1
    }

    print "Merging '" PdfLeft "' and '" PdfRight "'..."

    NumPagesLeft = getPageCount(PdfLeft)
    NumPagesRight = getPageCount(PdfRight)

    if (NumPagesLeft == 0 || NumPagesRight == 0) {
        print "Error: Failed to determine page count for one or both PDFs." >> "/dev/stderr"
        exit 1
    }

    print "Pages in " PdfLeft ": " NumPagesLeft
    print "Pages in " PdfRight ": " NumPagesRight

    if (NumPagesLeft != NumPagesRight) {
        print "Error: PDFs have different number of pages!" >> "/dev/stderr"
        exit 1
    }

    explodeToPages(PdfLeft)
    explodeToPages(PdfRight)

    cmd = "pdftk "
    cleanup = "rm "
    for (i = 1; i <= NumPagesLeft; i++) {
        pageLeft = sprintf("%s-%d.pdf", PdfLeft, i)
        pageRight = sprintf("%s-%d.pdf", PdfRight, i)
        cmd = cmd pageLeft " " pageRight " "
        cleanup = cleanup pageLeft " " pageRight " "
    }
    cmd = cmd "cat output combined.pdf"

    runOrError("Building combined.pdf", cmd)
    runOrError("Cleanup", cleanup)
}

function fileExists(file) {
    return (system("[ -f '" file "' ]") == 0)
}

function getPageCount(file) {
    cmd = "pdftk '" file "' dump_data | grep NumberOfPages | awk '{print $2}'"
    cmd | getline pages
    close(cmd)
    return pages + 0
}

function explodeToPages(file) {
    runOrError("Exploding pages for '" file "'",
        "pdftk '" file "' burst output '" file "-%d.pdf'")
}

function runOrError(msg, cmd) {
    printf "%s...", msg
    if (system(cmd) == 0) {
        print " done."
        return
    }
    print " error running: " cmd >> "/dev/stderr"
    exit 1
}

