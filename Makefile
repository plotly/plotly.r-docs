RDIR = .

DATA_DIR = $(RDIR)/r

BUILD_DIR = $(RDIR)/built/md
GATHER_SOURCE = $(wildcard $(BUILD_DIR)/*.Rmd)
GATHER_OUT = $(GATHER_SOURCE:.Rmd=.md)

RENDER = Rscript -e "rmarkdown::render('$<')"

all: $(GATHER_OUT)

$(BUILD_DIR)/%.docx:$(BUILD_DIR)/%.Rmd
        $(RENDER)